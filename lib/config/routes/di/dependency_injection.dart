import 'package:get_it/get_it.dart';
import 'package:link_pic/features/images/presentation/bloc/image_cubit.dart';

/// Initializing [sl] global variable
final GetIt sl = GetIt.instance;

/// sets the service locator for the project to use.
Future<void> setupServiceLocator() async {
  sl.registerFactory(() => ImageCubit());
}
