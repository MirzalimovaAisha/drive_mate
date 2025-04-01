import 'package:drive_mate/consts/color.dart';
import 'package:drive_mate/data/controller/auth_service.dart';
import 'package:drive_mate/widgets/button_widget.dart';
import 'package:drive_mate/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool light = false;
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void _handleLogin() async {
    final username = _idController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('모든 빈칸을 채워주세요.ㄴㅇ'))
      );
      return;
    }
    
    // 사용자 이름 유효성 검사: 4자 이상, 공백 없음
    if (username.isEmpty || username.length < 4 || username.contains(' ')) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('사용자 이름은 4자 이상이고 공백을 포함할 수 없습니다.'))
      );
      return;
    }

    // 비밀번호 유효성 검사: 4자 이상
    if (password.isEmpty || password.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('비밀번호는 4자 이상이어야 합니다.'))
      );
      return;
    }

    // 로그인 요청 후 응답 데이터 받기
    final responseData = await _authService.login(username, password);

    if (responseData["success"] == true) {

      // 로그인 성공 시 화면 이동
      Navigator.of(context).pushReplacementNamed('/car_selection');
    } else {
      // 로그인 실패 시 에러 메시지 출력
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('아이디 또는 비밀번호가 잘못되었습니다.'))
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  children: [
                    // ========= SYMBOL/LOGOTEXT ==========
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/hub_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg',
                          width:40,
                          colorFilter: ColorFilter.mode(brownColor, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 10,),
                        Text('Drive Mate', style: TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),)
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Image.asset('assets/images/red car.png'),
                    Text('로그인 정보를 입력하세요.', style: TextStyle(color: Colors.grey[200], ),),
                    const SizedBox(height: 20,),
                    // ============= username ===============
                   TextFieldWidget(
                     controller: _idController,
                     text: 'Username',
                     icon: Icon(Icons.person)
                   ),
                    const SizedBox(height: 10,),
                    // =========== password =============
                    TextFieldWidget(
                      controller: _passwordController,
                      obscureText: true,
                      text: 'Password',
                      icon: Icon(Icons.lock)
                    ),

                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            value: light,
                            onChanged: (bool value) {
                              setState(() {
                                light = value;
                              });
                            },
                            activeColor: Color(0xffb58779),
                          )

                        ),
                        Text('Remember', style: TextStyle(color: Colors.white, fontSize: 16),)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    ButtonWidget(

                      onPressed: (){
                        _handleLogin();
                      },
                      text: 'Sign in'
                    )
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                color: Color(0xff131313),
                padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('회원가입 기능이 준비 중입니다.'))
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        backgroundColor: Color(0xff7c7c7c),
                        foregroundColor: Colors.white
                      ),
                      child: Text('Sign Up'),
                    ),
                    const SizedBox(height: 5,),
                    ElevatedButton(
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('비밀번호 재설정 기능을 준비 중입니다.'))
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black
                      ),
                      child: Text('Password Reset'),
                    )
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
