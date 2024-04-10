import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_trustmebro/providers/user_providers.dart';
import 'package:project_trustmebro/responsive/mobile_screen_layout.dart';
import 'package:project_trustmebro/responsive/responsive_layout_screen.dart';
import 'package:project_trustmebro/responsive/web_screen_layout.dart';
import 'package:project_trustmebro/screens/get_screen_plus.dart';
import 'package:project_trustmebro/screens/give_screen_plus.dart';
import 'package:project_trustmebro/screens/lend_screen.dart';
import 'package:project_trustmebro/screens/login_screen.dart';
import 'package:project_trustmebro/firebase_options.dart';
import 'package:project_trustmebro/screens/signup_screen.dart';
import 'package:project_trustmebro/utils/colors.dart';
import 'package:project_trustmebro/widgets/post_card.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TrustMeBro',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        //  home: ResponsiveLayout(
        //    mobileScreenLayout: MobileScreenLayout(),
        //    webScreenLayout: WebScreenLayout(),
        //  ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const ResponsiveLayout(
                    mobileScreenLayout: MobileScreenLayout(),
                    webScreenLayout: WebScreenLayout(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: secondaryColor,
                ));
              }
              return const LoginScreen();
            }),
      ),
    );
  }
}
