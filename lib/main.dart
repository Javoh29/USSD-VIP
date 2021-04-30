import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/providers/navigation_provider.dart';
import 'utils/routes.dart';

void main() {
  runApp(UssdApp());
}

class UssdApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'USSD VIP',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xfff9f9f9),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Montserrat'
        ),
        onGenerateRoute: Routes.generateRoute
      ),
    );
  }
}

