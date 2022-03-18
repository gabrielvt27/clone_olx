import 'package:clone_olx/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Category {
  final String id;
  final String description;

  Category({
    required this.id,
    required this.description,
  });

  Category.fromParse(ParseObject parseObject)
      : id = parseObject.objectId!,
        description = parseObject.get(keyCategoryDescription);

  @override
  String toString() {
    return 'Category{id: $id, description: $description}';
  }
}
