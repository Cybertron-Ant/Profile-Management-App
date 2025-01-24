import 'package:get_it/get_it.dart';
import '../blocs/profile/profile_bloc.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Register blocs
  getIt.registerFactory<ProfileBloc>(() => ProfileBloc());
}