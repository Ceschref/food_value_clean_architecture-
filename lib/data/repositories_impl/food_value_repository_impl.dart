import 'package:web_provise/core/constants/constant_key.dart';
import 'package:web_provise/core/helper/local_storage_helper.dart';
import 'package:web_provise/core/http_client/custom_exception.dart';
import 'package:web_provise/core/http_client/list_response.dart';
import 'package:web_provise/data/data_sources/local_data_source/food_value_local_data_source.dart';
import 'package:web_provise/data/data_sources/remote_data_source/food_value_remote_data_source.dart';
import 'package:web_provise/domain/entity/food_value_entity.dart';
import 'package:web_provise/domain/repositories/food_value_repository.dart';

class FoodValueRepositoryImpl implements FoodValueRepository {
  FoodValueRepositoryImpl({
    required this.foodValueRemoteDataSource,
    required this.foodValueLocalDataSource,
  });

  final FoodValueRemoteDataSource foodValueRemoteDataSource;
  final FoodValueLocalDataSource foodValueLocalDataSource;

  @override
  Future<ListResponse<FoodValueEntity>> getListFoodValue(bool makeError) {
    if (!makeError) {
      if (LocalStorageHelper.checkDataExist(HiveKeys.listFoodValueKey)) {
        return foodValueLocalDataSource.getListFoodValue();
      }
      return foodValueRemoteDataSource.getListFoodValue();
    } else {
      throw CustomException('Proactive error', 'Proactive error');
    }
  }
}
