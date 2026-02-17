import 'package:flutter/material.dart';
import 'package:ticketing_apps/core/assets/asset.gen.dart';
import 'package:ticketing_apps/core/data/localdatasources/auth_local_datasource.dart';
import 'package:ticketing_apps/core/extentions/build_context_ext.dart';
import 'package:ticketing_apps/ui/auth/login_screen.dart';
import 'package:ticketing_apps/ui/home/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(
          Duration(seconds: 3),
          () => AuthLocalDataSource().isLoggedIn(),
        ),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.done) {
            if (asyncSnapshot.data == true) {
              return MainScreen();
            } else {
              return LoginScreen();
            }
          }
          return Stack(
            children: [
              Column(
                children: [
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(96),
                    child: Assets.images.logoBlue.image(),
                  ),
                  Spacer(),
                  Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 100,
                    child: Assets.images.logo.image(width: 100),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}