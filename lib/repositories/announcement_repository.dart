import 'dart:io';
import 'package:clone_olx/repositories/parse_errors.dart';
import 'package:clone_olx/repositories/table_keys.dart';
import 'package:clone_olx/view_models/announcement_view_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:path/path.dart' as path;

class AnnouncementRepository {
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