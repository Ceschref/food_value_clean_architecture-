import 'package:web_provise/core/http_client/custom_exception.dart';

class ListResponse<T> {
  ListResponse(
    dynamic json,
    T Function(dynamic itemJson) itemConverter, {
    String? keyName,
    this.extraData,
  }) {
    try {
      if (json is List) {
        items = json.map(itemConverter).toList();
      } else if (json is Map) {
        if ((keyName != null)) {
          if (json[keyName] != null) {
            items = (json[keyName] as List).map(itemConverter).toList();
          } else {
            items = [];
          }
        } else {
          items = json.values.map(itemConverter).toList();
        }
      } else {
        items = [];
      }
    } catch (e) {
      throw MappingDataException('When Map Data From ListResponse$e');
    }
  }

  late final List<T> items;
  final Map<String, dynamic>? extraData;

  @override
  String toString() {
    return items.map((f) => f.toString()).toString();
  }
}
