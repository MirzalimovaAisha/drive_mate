import 'package:drive_mate/consts/color.dart';
import 'package:drive_mate/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool light = false;
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
                    Container(
                      width: double.infinity,
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Color(0xfff7f7f7),
                        borderRadius: BorderRadius.circular(7)
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                          prefixIcon: Icon(Icons.person),
                          prefixIconColor: Colors.grey
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    // =========== password =============
                    Container(
                      width: double.infinity,
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Color(0xfff7f7f7),
                          borderRadius: BorderRadius.circular(7)
                      ),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                            prefixIcon: Icon(Icons.lock),
                            prefixIconColor: Colors.grey
                        ),
                      ),
                    ),

                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            value: light,
                            onChanged: (bool value){
                              setState(() {
                                light = value;
                              });
                            },
                            activeColor: Color(0xffb58779),
                          ),
                        ),
                        Text('Remember', style: TextStyle(color: Colors.white, fontSize: 16),)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    ButtonWidget(
                      onPressed: (){
                        Navigator.of(context).pushReplacementNamed('/car_selection');
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
