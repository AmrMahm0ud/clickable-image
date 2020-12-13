import 'package:clickable_regions/car_widget_bloc/car_widget_event.dart';
import 'package:clickable_regions/car_widget_bloc/car_widget_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'car_widget_state.dart';

class CarWidgetBloc extends Bloc<CarWidgetEvent, CarWidgetState> {
     CarWidgetRepository carWidgetRepository ;
     CarWidgetBloc(this.carWidgetRepository) : super(null);

  @override
  Stream<CarWidgetState> mapEventToState(CarWidgetEvent event) async* {
    if (event is ShowCarEvent){
      yield LoadingState();
      yield await carWidgetRepository.extractPathAndName(event.context, event.svgPath);
    }
    else if (event is OpenDialogEvent) {
      yield OpenDialogState(event.carModel);
    }else if (event is YesButtonPressedEvent) {
      yield carWidgetRepository.selectPart(event.carModel);
    } else if (event is CancelButtonPressedEvent){
      yield carWidgetRepository.cancel();
    }else if (event is NoButtonPressedEvent){
      yield carWidgetRepository.unSelectPart(event.carModel);
    }
  }
}