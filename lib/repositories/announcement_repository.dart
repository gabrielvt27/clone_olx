import 'dart:io';
import 'package:clone_olx/models/announcement.dart';
import 'package:clone_olx/models/category.dart';
import 'package:clone_olx/models/user.dart';
import 'package:clone_olx/repositories/parse_errors.dart';
import 'package:clone_olx/repositories/table_keys.dart';
import 'package:clone_olx/stores/filter_store.dart';
import 'package:clone_olx/view_models/announcement_view_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:path/path.dart' as path;

class AnnouncementRepository {
  Future<List<Announcement>> getHomeAdList({
    required FilterStore filter,
    String? search,
    Category? category,
  }) async {
    final query = QueryBuilder<ParseObject>(ParseObject(keyAdTable));

    query.includeObject([keyAdOwner, keyAdCategory]);

    query.setLimit(20);

    query.whereEqualTo(keyAdStatus, AnnouncementStatus.active.index);

    if (search != null && search.trim().isNotEmpty) {
      query.whereContains(keyAdTitle, search, caseSensitive: false);
    }

    if (category != null && category.id != '*') {
      final parseObjectCategory = ParseObject(keyCategoryTable)
        ..set(keyCategoryId, category.id);
      query.whereEqualTo(keyAdCategory, parseObjectCategory.toPointer());
    }

    switch (filter.orderBy) {
      case OrderBy.price:
        query.orderByAscending(keyAdPrice);
        break;
      case OrderBy.date:
      default:
        query.orderByAscending(keyAdCreatedAt);
        break;
    }

    if (filter.minPrice != null && filter.minPrice! > 0) {
      query.whereGreaterThanOrEqualsTo(keyAdPrice, filter.minPrice);
    }

    if (filter.maxPrice != null && filter.maxPrice! > 0) {
      query.whereLessThanOrEqualTo(keyAdPrice, filter.maxPrice);
    }

    if (filter.vendorType > 0 &&
        filter.vendorType <
            (VENDOR_TYPE_PARTICULAR | VENDOR_TYPE_PROFESSIONAL)) {
      final userQuery = QueryBuilder<ParseUser>(ParseUser.forQuery());

      if (filter.vendorType == VENDOR_TYPE_PARTICULAR) {
        userQuery.whereEqualTo(keyUserType, UserType.particular.index);
      }

      if (filter.vendorType == VENDOR_TYPE_PROFESSIONAL) {
        userQuery.whereEqualTo(keyUserType, UserType.professional.index);
      }

      query.whereMatchesQuery(keyAdOwner, userQuery);
    }

    final response = await query.query();
    if (response.success && response.results != null) {
      return (response.results as List)
          .map((po) => Announcement.fromParse(po))
          .toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> save(AnnouncementViewModel ad) async {
    try {
      final parseImages = await saveImages(ad.images);

      final parseUser = ParseUser(ad.user.name, null, ad.user.email)
        ..set(keyUserId, ad.user.id);

      final adObject = ParseObject(keyAdTable);

      final parseAcl = ParseACL(owner: parseUser)
        ..setPublicReadAccess(allowed: true)
        ..setPublicWriteAccess(allowed: false);

      adObject.setACL(parseAcl);

      adObject.set<String>(keyAdTitle, ad.title);
      adObject.set<String>(keyAdDescription, ad.description);
      adObject.set<num>(keyAdPrice, ad.price);
      adObject.set<int>(keyAdStatus, ad.status.index);
      adObject.set<bool>(keyAdHidePhone, ad.hidePhone);
      adObject.set<String>(keyAdDistrict, ad.address.district);
      adObject.set<String>(keyAdCity, ad.address.city.nome);
      adObject.set<String>(keyAdFederativeUnit, ad.address.uf.sigla!);
      adObject.set<String>(keyAdPostalCode, ad.address.cep);
      adObject.set<List<ParseFile>>(keyAdImages, parseImages);
      adObject.set<ParseUser>(keyAdOwner, parseUser);
      adObject.set<ParseObject>(keyAdCategory,
          ParseObject(keyCategoryTable)..set(keyCategoryId, ad.category.id));

      final response = await adObject.save();

      if (!response.success) {
        Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao salvar anúncio\n${e.toString()}');
    }
  }

  Future<List<ParseFile>> saveImages(List images) async {
    final parseImages = <ParseFile>[];

    try {
      for (final image in images) {
        if (image is File) {
          final parseFile = ParseFile(image, name: path.basename(image.path));
          final response = await parseFile.save();
          if (!response.success) {
            return Future.error(
                ParseErrors.getDescription(response.error!.code));
          }
          parseImages.add(parseFile);
        } else {
          final parseFile = ParseFile(null);
          parseFile.name = path.basename(image);
          parseFile.url = image;
          parseImages.add(parseFile);
        }
      }

      return parseImages;
    } catch (e) {
      return Future.error("Falha ao salvar imagens");
    }
  }
}
