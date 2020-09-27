import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/details/details_screen.dart';
import 'package:furniture_app/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login/login_screen.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'screens/registration/registration_screen.dart';
import 'screens/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/langs/',
    //apiKeyGoogle: '<Key>', // NOT YET TESTED
  );

  runApp(
    LocalizedApp(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // Here we set DM Sans as our default fonts
        // Now we also apply out text color to all flutter textTheme
        textTheme:
            GoogleFonts.dmSansTextTheme().apply(displayColor: kTextColor),
        // Almost all of our app bar have this style
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          brightness: Brightness.light,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        DetailsScreen.id: (context) => DetailsScreen(),
      },
      localizationsDelegates: translator.delegates, // Android + iOS Delegates
      locale: translator.locale, // Active locale
      supportedLocales: translator.locals(),
    );
  }
}
