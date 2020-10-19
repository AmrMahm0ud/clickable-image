
import 'package:clickable_regions/model/car_model.dart';

abstract class PaintEvent {
}

class ShowCarEvent extends PaintEvent {
final List<CarModel> imageList;
ShowCarEvent(this.imageList);
}

class YesButtonPressedEvent extends PaintEvent {
  final index ;
  final List<CarModel> imageList;
  YesButtonPressedEvent(this.index , this.imageList);
}


class NoButtonPressedEvent extends PaintEvent {
  final index ;
  final List<CarModel> imageList;
  NoButtonPressedEvent(this.index , this.imageList);
}


class CancelButtonPressedEvent extends PaintEvent {
 final List<CarModel> imageList;
 CancelButtonPressedEvent(this.imageList);
}

class OpenDialogEvent extends PaintEvent {
final CarModel carModel;
OpenDialogEvent(this.carModel);
}