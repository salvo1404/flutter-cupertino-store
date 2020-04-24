import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';         // NEW

import 'app.dart';
import 'model/app_state_model.dart';             // NEW

void main() {
  WidgetsFlutterBinding.ensureInitialized();

 SystemChrome.setPreferredOrientations(
     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

 return runApp(
   ChangeNotifierProvider(
      create: (context) => AppStateModel(),
      child: CupertinoStoreApp(),
    ),
 );
}