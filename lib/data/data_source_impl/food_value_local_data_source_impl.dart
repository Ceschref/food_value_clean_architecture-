import 'package:web_provise/domain/data_sources/local_data_source/food_value_local_data_source.dart';
import 'package:web_provise/core/constants/constant_key.dart';
import 'package:web_provise/core/helper/local_storage_helper.dart';
import 'package:web_provise/core/http_client/custom_exception.dart';
import 'package:web_provise/core/http_client/list_response.dart';
import 'package:web_provise/data/models/food_value_model.dart';

class FoodValueLocalDataSourceImpl implements FoodValueLocalDataSource {
  @override
  Future<ListResponse<FoodValueModel>> getListFoodValue() async {
    try {
      return ListResponse<FoodValueModel>(
        LocalStorageHelper.getValue(HiveKeys.listFoodValueKey),
        (itemJson) => FoodValueModel.fromJson(itemJson),
      );
    } on MappingDataException catch (e) {
      LocalStorageHelper.deleteValue(HiveKeys.listFoodValueKey);
      throw CustomException(e.getStatus(), e.getMessage());
    }
  }
}
