import 'package:drive_mate/consts/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AnimationController _symbolController;
  late AnimationController _logoTextController;
  late AnimationController _sloganTextController;
  late AnimationController _carController;

  late Animation<double> _symbolAnimation;
  late Animation<double> _logoTextAnimation;
  late Animation<double> _sloganTextAnimation;
  late Animation<double> _carAnimation;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/hub_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg',width: 90, color: BROWNCOLOR,),
            const SizedBox(height: 10,),
            Text('Drive Mate', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
            const SizedBox(height: 5,),
            Text('연결하고, 운전하고, 즐기세요', style: TextStyle(fontSize: 18, color: Colors.grey, ),),
            
            const SizedBox(height: 50,),
            Image.asset('assets/images/car.png')
          ],
        ),
      ),
    );
  }
}

























