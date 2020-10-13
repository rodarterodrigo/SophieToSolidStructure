import 'package:bloc/bloc.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/errors/errors.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/states/navigation_state.dart';

class NavigationBloc extends Bloc<int, INavigationState>{

  int _index = 0;
  get index => _index;
  set index(value) => _index = value;

  NavigationBloc() : super(IndexSuccess());

  @override
  Stream<INavigationState> mapEventToState(int index) async*{
    if(index == null) yield IndError(IndexError(message: "Error on solving index"));
    this.index = index;
    yield IndexSuccess(index: this.index);
  }
}