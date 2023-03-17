part of 'food_value_cubit.dart';

class FoodValueState extends Equatable {
  const FoodValueState({
    this.getListFoodValueDataState = DataState.init,
    this.listFoodValue,
    this.errorMessage,
  });

  final DataState getListFoodValueDataState;
  final List<FoodValueEntity>? listFoodValue;
  final String? errorMessage;

  @override
  List<Object> get props => [
        getListFoodValueDataState,
      ];

  FoodValueState copyWith({
    DataState? getListFoodValueDataState,
    List<FoodValueEntity>? listFoodValue,
    String? errorMessage,
  }) {
    return FoodValueState(
      getListFoodValueDataState: getListFoodValueDataState ?? this.getListFoodValueDataState,
      listFoodValue: listFoodValue ?? this.listFoodValue,
      errorMessage: errorMessage,
    );
  }
}
