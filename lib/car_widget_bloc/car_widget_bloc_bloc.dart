import 'package:clickable_regions/car_widget_bloc/car_widget_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'car_widget_state.dart';

class CarWidgetBloc extends Bloc<CarWidgetEvent, CarWidgetState> {
  CarWidgetBloc(CarWidgetState initialState) : super(initialState);

  @override
  Stream<CarWidgetState> mapEventToState(CarWidgetEvent event) async* {
    if (event is ShowCarEvent){
      yield ImageListLoadedState(event.imageList);
    }
    else if (event is OpenDialogEvent) {
      yield OpenDialogState(event.carModel);
    }else if (event is YesButtonPressedEvent) {
      yield SelectedState(event.imageList);
    } else if (event is CancelButtonPressedEvent){
      yield CancelState(event.imageList);
    }else if (event is NoButtonPressedEvent){
      yield UnSelectedState(event.imageList);
    }
  }
}