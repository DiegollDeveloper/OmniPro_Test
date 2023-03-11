import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'package:omnipro_test/navigator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:omnipro_test/core/utils/app_colors.dart';
import 'package:omnipro_test/core/utils/common_functions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "lib/.env");
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omni Pro Test',
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      theme: ThemeData(
        primarySwatch:
            CommonFunctions.getMaterialColorFromColor(AppColors.primary),
      ),
      onGenerateRoute: AppNavigator.generateRoute,
      locale: const Locale('es', 'ES'),
    );
  }
}
