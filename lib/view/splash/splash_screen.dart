import 'package:assignment_7/services/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../routes/routes_name.dart';

// Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final userPreferences = UserPreferences();

  @override
  void initState() {
    super.initState();
    userPreferences.getUserInfo();
    navigation();
  }

  void navigation() {
    Duration duration = const Duration(seconds: 3);
    Future.delayed(
      duration,
          () {
        if (UserPreferences.loggedIn==true) {
          // its yes move to dashboard screen
          context.go(RoutesName.dashboardScreen);
        } else {
          // its no move to login screen
          context.go(RoutesName.loginScreen);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          // Use LayoutBuilder to adapt padding based on screen constraints
          padding: EdgeInsets.all(15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Blog App",
                style: TextStyle(
                  fontSize:  40.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "DancingScript",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.r),
                child: const Center(
                  child: SpinKitChasingDots(
                    color: Colors.black,
                    size: 45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
