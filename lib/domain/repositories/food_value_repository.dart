import 'package:web_provise/core/http_client/list_response.dart';
import 'package:web_provise/domain/entity/food_value_entity.dart';

abstract class FoodValueRepository {
  Future<ListResponse<FoodValueEntity>> getListFoodValue(bool makeError);
}
