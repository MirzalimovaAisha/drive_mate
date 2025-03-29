import 'package:drive_mate/consts/color.dart';
import 'package:drive_mate/screens/bottom_navi_screen.dart';
import 'package:drive_mate/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarSelectionScreen extends StatefulWidget {
  const CarSelectionScreen({super.key});

  @override
  State<CarSelectionScreen> createState() => _CarSelectionScreenState();
}

class _CarSelectionScreenState extends State<CarSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/cloud1.png', width: double.infinity, height: 400, fit: BoxFit.fitHeight,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
              child: Center(
                child: Column(
                  children: [
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
                    const SizedBox(height: 150,),
                    Image.asset('assets/images/cars/genesis-kr-gv80-facelift-color-glossy-vik-black-large.png'),
                    const SizedBox(height: 30,),

                    ButtonWidget(
                      onPressed: (){
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Color(0xdbffffff),
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          builder: (BuildContext context){
                            return Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('차량등록하기', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                      InkWell(
                                        onTap: (){
                                          Navigator.of(context).pop();
                                        },
                                        child: Icon(Icons.cancel_outlined, size: 30,)
                                      ),
                                    ],
                                  ),

                                const SizedBox(height: 30,),

                                //  ========== 차량 이름 ==================
                                  Container(
                                    width: double.infinity,
                                    height: 45,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Color(0xfff8f8f8),
                                        borderRadius: BorderRadius.circular(7)
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '차량 이름',
                                          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                                          prefixIcon: Icon(Icons.directions_car_outlined, size: 35,),
                                          prefixIconColor: Colors.black
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 10,),
                                  //  ========== 차량 이름 ==================
                                  Container(
                                    width: double.infinity,
                                    height: 45,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Color(0xfff8f8f8),
                                        borderRadius: BorderRadius.circular(7)
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '차량 번호',
                                          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                                          prefixIcon: Icon(Icons.pin_outlined, size: 35,),
                                          prefixIconColor: Colors.black
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 10,),

                                  // ============= 이미지 ==============
                                  Container(
                                    width: double.infinity,
                                    height: 150,
                                    color: Color(0xffeeeeee),
                                    child: Center(
                                      child: Icon(Icons.image_outlined, size: 40),
                                    ),
                                  ),

                                  const SizedBox(height: 10,),
                                  Text(
                                    textAlign: TextAlign.center,
                                    '이미지를 선택 해 주세요. \n 갤러리 앱 또는 카메라를 이용하실 수 있습니다.',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 16,
                                      height: 1
                                    ),
                                  ),
                                  const SizedBox(height: 30,),
                                  ButtonWidget(
                                    onPressed: (){
                                      Navigator.pushReplacement(
                                          context, 
                                          MaterialPageRoute(builder: (context) => BottomNaviScreen())
                                      );
                                    },
                                    text: '차량 등록 후 이용하기',
                                  ),
                                  const SizedBox(height: 30,)
                                ],
                              ),
                            );
                          }
                        );
                      },
                      text: '차량 등록 후 이용하기'
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
