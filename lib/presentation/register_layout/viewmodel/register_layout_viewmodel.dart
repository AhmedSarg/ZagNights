import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/presentation/base/base_cubit.dart';

class RegisterLayoutViewModel extends BaseCubit {

  static get(context) => BlocProvider.of<RegisterLayoutViewModel>(context);

  @override
  void start() {}
}
