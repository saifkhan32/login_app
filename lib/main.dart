import 'package:assignment/constants/global_variables.dart';
import 'package:assignment/home_screen.dart';
import 'package:assignment/login_screen.dart';
import 'package:assignment/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
void main() {
  runApp(  const LoginApp());


}

class LoginApp extends StatelessWidget {
   const LoginApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      final _router = GoRouter(
  initialLocation: '/',
  routes: 
  [
    GoRoute(
      name : 'login_screen',
      path: '/',
      builder: (context, state) => const AuthScreen(),
    ),
        // one sub-route
        GoRoute(
          name : 'home_screen',
          path: '/home_screen',
          builder: (context, state) => const HomeScreen(),
        ),
          GoRoute(
            name : 'profile_screen',
          path: '/profile',
          builder: (BuildContext context, state) => const ProfileScreen(),
        )
        
]);
    return  MaterialApp.router(
        title: 'Login App',
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
          theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.highContrastLight(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      
    ));
  }


}

