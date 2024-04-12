import 'package:web_provise/domain/entity/food_value_entity.dart';
import '../../../core/http_client/list_response.dart';

abstract class FoodValueRemoteDataSource {
  Future<ListResponse<FoodValueEntity>> getListFoodValue();
}
