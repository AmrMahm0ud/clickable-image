import 'package:clickable_regions/clickable_car_widget/model/car_model.dart';
import 'package:flutter/cupertino.dart';

abstract class CarWidgetEvent {}

class ShowCarEvent extends CarWidgetEvent {
  BuildContext context;
  final String svgPath;
  ShowCarEvent(this.context, this.svgPath);
}

class YesButtonPressedEvent extends CarWidgetEvent {
  final CarModel carModel;
  YesButtonPressedEvent(this.carModel);
}

class NoButtonPressedEvent extends CarWidgetEvent {
  final CarModel carModel;
  NoButtonPressedEvent(this.carModel);
}

class CancelButtonPressedEvent extends CarWidgetEvent {
  CancelButtonPressedEvent();
}

class OpenDialogEvent extends CarWidgetEvent {
  final CarModel carModel;
  OpenDialogEvent(this.carModel);
}
