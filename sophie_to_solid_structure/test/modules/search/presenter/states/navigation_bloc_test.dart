import 'package:flutter_test/flutter_test.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/states/navigation_state.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/views/home_bloc/navigation_bloc.dart';

main(){
  final bloc = NavigationBloc();

  test("Must return the states in order", (){
    expect(bloc, emitsInOrder([
      isA<IndexSuccess>(),
    ]));
    bloc.add(2);
  });

  test("Must return an error", (){
    expect(bloc, emitsInOrder([
      isA<IndError>(),
    ]));
    bloc.add(null);
  });
}