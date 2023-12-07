import 'package:web_provise/core/http_client/list_response.dart';
import 'package:web_provise/data/models/food_value_model.dart';

abstract class FoodValueLocalDataSource {
  Future<ListResponse<FoodValueModel>> getListFoodValue();
}
