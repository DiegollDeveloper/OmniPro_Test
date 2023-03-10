import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omnipro_test/features/home/domain/usecases/retrieve_api_elements.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetApiElementsUseCase? getApiElementsUseCase;

  HomeCubit({
    this.getApiElementsUseCase,
  }) : super(HomeState.initial());

  Future<void> onLoadPage() async {}
}
