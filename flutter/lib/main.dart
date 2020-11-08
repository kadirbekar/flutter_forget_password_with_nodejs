import 'package:flutter/material.dart';
import 'package:forget_password/core/states/request_state.dart';
import 'package:forget_password/locator.dart';
import 'package:provider/provider.dart';
import 'ui/views/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RequestState>(create: (_) => RequestState())
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
