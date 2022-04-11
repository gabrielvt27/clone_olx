import 'package:clone_olx/models/announcement.dart';
import 'package:clone_olx/models/user.dart';
import 'package:clone_olx/repositories/parse_errors.dart';
import 'package:clone_olx/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class FavoriteRepository {
  Future<List<Announcement>> getFavorites(User user) async {
    try {
      final queryBuilder =
          QueryBuilder<ParseObject>(ParseObject(keyFavoritesTable));

      queryBuilder.whereEqualTo(keyFavoritesOwner, user.id);
      queryBuilder.includeObject([
        keyFavoritesAd,
        '$keyFavoritesAd.$keyAdOwner',
        '$keyFavoritesAd.$keyAdCategory'
      ]);

      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        return (response.results as List<ParseObject>)
            .map((po) => Announcement.fromParse(po.get(keyFavoritesAd)))
            .toList();
      } else if (response.success && response.result == null) {
        return [];
      } else {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      print(e.toString());
      return Future.error('Falha ao buscar anúncios favoritados');
    }
  }

  Future<void> save({
    required Announcement ad,
    required User user,
  }) async {
    final favoriteObject = ParseObject(keyFavoritesTable);

    favoriteObject.set<String>(keyFavoritesOwner, user.id);
    favoriteObject.set<ParseObject>(
      keyFavoritesAd,
      ParseObject(keyAdTable)..set(keyAdId, ad.id),
    );

    final response = await favoriteObject.save();

    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> delete({
    required Announcement ad,
    required User user,
  }) async {
    try {
      final queryBuilder =
          QueryBuilder<ParseObject>(ParseObject(keyFavoritesTable));

      queryBuilder.whereEqualTo(keyFavoritesOwner, user.id);
      queryBuilder.whereEqualTo(
          keyFavoritesAd, ParseObject(keyAdTable)..set(keyAdId, ad.id));

      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        for (final adFav in response.results as List<ParseObject>) {
          await adFav.delete();
        }
      }
    } catch (e) {
      return Future.error('Falha ao deletar favorito');
    }
  }
}
