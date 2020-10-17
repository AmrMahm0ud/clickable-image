
import 'package:clickable_regions/model/car_model.dart';

abstract class PaintEvent {
  PaintEvent();
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


}

class BuildImageListEvent extends PaintEvent {

}

class OpenDialogEvent extends PaintEvent {
final CarModel carModel;
OpenDialogEvent(this.carModel);
}