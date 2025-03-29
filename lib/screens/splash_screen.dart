import 'package:drive_mate/consts/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late AnimationController _symbolController;
  late AnimationController _logoTextController;
  late AnimationController _sloganTextController;
  late AnimationController _carController;

  late Animation<Offset> _symbolAnimation;
  late Animation<Offset> _logoTextAnimation;
  late Animation<Offset> _sloganTextAnimation;
  late Animation<double> _carAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 심볼 애니메이션 (위에서 아래로 슬라이드 + 페이드 인)
    _symbolController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _symbolAnimation = Tween<Offset>(begin: const Offset(0, -10), end: Offset.zero)
        .animate(CurvedAnimation(parent: _symbolController, curve: Curves.easeOut));

    // 로고 텍스트 애니메이션 (페이드 인)
    _logoTextController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _logoTextAnimation = Tween<Offset>(begin: const Offset(5, 0), end: Offset.zero).animate(
        CurvedAnimation(parent: _logoTextController, curve: Curves.easeOut));

    // 슬로건 애니메이션 (왼쪽에서 오른쪽으로 슬라이드)
    _sloganTextController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _sloganTextAnimation = Tween<Offset>(begin: const Offset(-5, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _sloganTextController, curve: Curves.easeOut));

    // 자동차 애니메이션 (크기 확대)
    _carController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _carAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _carController, curve: Curves.elasticOut));

    // 순차적으로 실행
    _startAnimations();
  }
  Future<void> _startAnimations() async {
    await _symbolController.forward();
    await _logoTextController.forward();
    await _sloganTextController.forward();
    await _carController.forward();
    await Future.delayed(Duration(milliseconds: 100));
    naviToSignIn();
  }

  void naviToSignIn(){
    Navigator.of(context).pushReplacementNamed('/sign_in');
  }

  @override
  void dispose() {
    _symbolController.dispose();
    _logoTextController.dispose();
    _sloganTextController.dispose();
    _carController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 심볼 애니메이션 (슬라이드 + 페이드 인)
            SlideTransition(
              position: _symbolAnimation,
              child: SvgPicture.asset(
                'assets/icons/hub_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg',
                width: 90,
                colorFilter: ColorFilter.mode(brownColor, BlendMode.srcIn),
              ),
            ),
            const SizedBox(height: 10),

            // 로고 텍스트 (페이드 인)
            SlideTransition(
              position: _logoTextAnimation,
              child: const Text(
                'Drive Mate',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const SizedBox(height: 5),

            // 슬로건 텍스트 (왼쪽에서 오른쪽으로 슬라이드)
            SlideTransition(
              position: _sloganTextAnimation,
              child: const Text(
                '연결하고, 운전하고, 즐기세요',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 50),

            // 자동차 이미지 (크기 확대)
            ScaleTransition(
              scale: _carAnimation,
              child: Image.asset('assets/images/car.png'),
            ),
          ],
        ),
      ),
    );
  }
}

























