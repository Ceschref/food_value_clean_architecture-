import 'package:web_provise/data/models/food_value_model.dart';

import '../../../core/http_client/list_response.dart';

abstract class FoodValueLocalDataSource {
  Future<ListResponse<FoodValueModel>> getListFoodValue();
}
