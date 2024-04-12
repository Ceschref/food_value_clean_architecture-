import 'package:web_provise/core/http_client/api_provider.dart';
import 'package:web_provise/core/http_client/custom_exception.dart';
import 'package:web_provise/core/http_client/list_response.dart';
import 'package:web_provise/data/models/food_value_model.dart';
import 'package:web_provise/domain/data_sources/remote_data_source/food_value_remote_data_source.dart';
import 'package:web_provise/domain/entity/food_value_entity.dart';

class FoodValueRemoteDataSourceImpl implements FoodValueRemoteDataSource {
  FoodValueRemoteDataSourceImpl({required this.apiProvider});

  ApiProviderRepository apiProvider;

  @override
  Future<ListResponse<FoodValueEntity>> getListFoodValue() async {
    try {
      final rawResponse = await apiProvider.getRequest(
        'https://hf-android-app.s3-eu-west-1.amazonaws.com/android-test/recipes.json',
      );
      if (rawResponse.statusCode == 200) {
        return ListResponse<FoodValueEntity>(
          rawResponse.data,
          (itemJson) => FoodValueModel.fromJson(itemJson),
        );
      } else {
        throw CustomException(rawResponse.statusCode, rawResponse.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
