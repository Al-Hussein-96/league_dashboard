import 'package:flutter/material.dart';
import 'package:league_dashboard/core/utils/router.dart';

import 'core/utils/constants.dart';
import 'core/utils/theme.dart';
import 'injection_container.dart' as di; //Dependency injector

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(); //Inject all the dependencies and wait for it is done (i.e. UI won't built until all the dependencies are injected)
  // _setupLogging();
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'League Dashboard',
      // theme: CustomTheme.mainTheme,
      onGenerateRoute: MyRouter.generateRoute,
      initialRoute: LOGIN_ROUTE,
    );
  }
}

