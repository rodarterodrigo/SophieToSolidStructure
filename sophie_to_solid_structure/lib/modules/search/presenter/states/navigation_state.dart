import 'package:sophie_to_solid_structure/modules/search/domain/errors/errors.dart';

abstract class INavigationState{}

class IndexSuccess implements INavigationState{
  final int index;
  IndexSuccess(this.index);
}

class IndError implements INavigationState{
  final IndexError indexError;
  IndError(this.indexError);
}

class IndexStart implements INavigationState{}