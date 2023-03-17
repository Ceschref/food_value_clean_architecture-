import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:web_provise/core/constants/data_state.dart';
import 'package:web_provise/core/helper/local_storage_helper.dart';
import 'package:web_provise/core/http_client/custom_exception.dart';
import 'package:web_provise/data/models/food_value_model.dart';
import 'package:web_provise/domain/entity/food_value_entity.dart';
import 'package:web_provise/domain/repositories/food_value_repository.dart';

import '../../../core/constants/constant_key.dart';

part 'food_value_state.dart';

class FoodValueCubit extends Cubit<FoodValueState> {
  FoodValueCubit({required this.foodValueRepository}) : super(const FoodValueState());

  final FoodValueRepository foodValueRepository;

  void getListFoodValue({bool makeError = false}) async {
    try {
      emit(state.copyWith(getListFoodValueDataState: DataState.preload));
      final result = await foodValueRepository.getListFoodValue(makeError);
      final jsos = result.items.map((x) => (x as FoodValueModel).toJson()).toList();
      LocalStorageHelper.setValue(HiveKeys.listFoodValueKey, jsos);
      emit(
        state.copyWith(
          getListFoodValueDataState: DataState.data,
          listFoodValue: result.items,
        ),
      );
    } on CustomException catch (e) {
      emit(state.copyWith(getListFoodValueDataState: DataState.error, errorMessage: e.getMessage()));
    }
  }
}
