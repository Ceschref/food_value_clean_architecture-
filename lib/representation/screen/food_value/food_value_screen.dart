import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_provise/core/constants/data_state.dart';
import 'package:web_provise/representation/cubit/food_value_cubit/food_value_cubit.dart';

import '../../widget/item_food_value_widget.dart';

class FoodValueScreen extends StatefulWidget {
  const FoodValueScreen({super.key});

  @override
  State<FoodValueScreen> createState() => _FoodValueScreenState();
}

class _FoodValueScreenState extends State<FoodValueScreen> {
  late final FoodValueCubit _foodValueCubit;
  final ValueNotifier<bool> _makeError = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _foodValueCubit = context.read<FoodValueCubit>();
    _foodValueCubit.getListFoodValue();
  }

  @override
  void dispose() {
    super.dispose();
    _foodValueCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Food Value'),
        ),
        body: Container(
          color: const Color(0xFFF5F5F5),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: _makeError,
                builder: (context, snapshot, _) {
                  return SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      'Make Error',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    activeColor: Colors.green,
                    value: snapshot,
                    onChanged: (bool value) {
                      _foodValueCubit.getListFoodValue(makeError: value);
                      _makeError.value = value;
                    },
                  );
                },
              ),
              Expanded(
                child: BlocBuilder<FoodValueCubit, FoodValueState>(
                  buildWhen: (previous, current) => previous.getListFoodValueDataState != current.getListFoodValueDataState,
                  builder: (context, state) {
                    if (state.getListFoodValueDataState.isShowLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.getListFoodValueDataState.isDataStateFailure) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Error: ${state.errorMessage ?? ''}',
                              style: const TextStyle(color: Colors.red),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                _foodValueCubit.getListFoodValue(makeError: _makeError.value);
                              },
                              child: const Text(
                                'Try again!',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.listFoodValue?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ItemFoodValueWidget(foodValue: state.listFoodValue?[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
