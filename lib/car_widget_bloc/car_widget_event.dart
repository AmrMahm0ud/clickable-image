import 'package:clickable_regions/model/car_model.dart';

abstract class CarWidgetEvent {
}

class ShowCarEvent extends CarWidgetEvent {
  final List<CarModel> imageList;
  ShowCarEvent(this.imageList);
}

class YesButtonPressedEvent extends CarWidgetEvent {
  final index ;
  final List<CarModel> imageList;
  YesButtonPressedEvent(this.index , this.imageList);
}


class NoButtonPressedEvent extends CarWidgetEvent {
  final index ;
  final List<CarModel> imageList;
  NoButtonPressedEvent(this.index , this.imageList);
}


class CancelButtonPressedEvent extends CarWidgetEvent {
  final List<CarModel> imageList;
  CancelButtonPressedEvent(this.imageList);
}

class OpenDialogEvent extends CarWidgetEvent {
  final CarModel carModel;
  OpenDialogEvent(this.carModel);
}