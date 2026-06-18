import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti5/features/cubit/bmi_state.dart';



class BmiCubit extends Cubit<BmiState> {
  BmiCubit()
      : super(
          BmiState(
            gender: 'male',
            height: 170,
            age: 20,
            weight: 70,
          ),
        );

 
  void changeGender(String gender) {
    emit(state.copyWith(gender: gender));
  }


  void changeHeight(double height) {
    emit(state.copyWith(height: height));
  }

  
  void incrementAge() {
    emit(state.copyWith(age: state.age + 1));
  }

  void decrementAge() {
    if (state.age > 1) {
      emit(state.copyWith(age: state.age - 1));
    }
  }

 
  void incrementWeight() {
    emit(state.copyWith(weight: state.weight + 1));
  }

  void decrementWeight() {
    if (state.weight > 1) {
      emit(state.copyWith(weight: state.weight - 1));
    }
  }

  
  double calculateBmi() {
    final heightInMeter = state.height / 100;

    return state.weight / (heightInMeter * heightInMeter);
  }
}