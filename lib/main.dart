import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'app/app.dart';
import 'app/sl.dart';
import 'presentation/base/bloc_observer.dart';
import 'presentation/resources/langauge_manager.dart';

late final WidgetsBinding engine;

void main() async {
  engine = WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  // await (await SharedPreferences.getInstance()).clear();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseAuth? fba = FirebaseAuth.instance;
  // User? user = fba.currentUser;
  // if (user != null) {
  //   print(user.email);
  // }else {
  //   print('null user');
  // }

  await initAppModule();

  runApp(
    EasyLocalization(
      supportedLocales: AppLanguages.locals,
      path: AppLanguages.translationsPath,
      fallbackLocale: AppLanguages.fallBackLocal,
      startLocale: AppLanguages.startLocal,
      useOnlyLangCode: true,
      saveLocale: true,
      child: const MyApp(),
    ),
  );
}
