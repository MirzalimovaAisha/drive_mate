import 'package:drive_mate/consts/color.dart';
import 'package:drive_mate/data/controller/car_service.dart';
import 'package:drive_mate/screens/bottom_navi_screen.dart';
import 'package:drive_mate/widgets/button_widget.dart';
import 'package:drive_mate/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CarSelectionScreen extends StatefulWidget {
  const CarSelectionScreen({super.key});

  @override
  State<CarSelectionScreen> createState() => _CarSelectionScreenState();
}

class _CarSelectionScreenState extends State<CarSelectionScreen> {
  final TextEditingController _carNameController = TextEditingController();
  final TextEditingController _carNumController = TextEditingController();
  final CarService _carService = CarService();

  void _handleCar()async{
    final carName =  _carNameController.text.trim();
    final carNum = _carNumController.text.trim();

    if (carName.isEmpty || carNum.isEmpty || _selectedImage == null){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('모든 빌드를 입력해주세요'))
      );
      print('모든 빌드를 입력해주세요');
      return;
    }
    try{
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNaviScreen())
      );
    } catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('차량 등록 실패'))
      );
      print('차량 등록 실패');
    }
  }



  /// ============= 이미지 업로드 ===================
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }
  /// ==============================================




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
                                  TextFieldWidget(
                                    text: '차량 이름',
                                    icon: Icon(Icons.directions_car_outlined, color: Colors.black, size: 35,),
                                    controller: _carNameController,
                                  ),
                                  const SizedBox(height: 10,),

                                  //  ========== 차량 번호 ==================
                                  TextFieldWidget(
                                    text: '차량 번호',
                                    icon: Icon(Icons.pin_outlined, color: Colors.black, size: 35,),
                                    controller: _carNumController,
                                  ),

                                  const SizedBox(height: 10,),

                                  // ============= 이미지 ==============
                                  InkWell(
                                    onTap: _showImagePickerOptions,
                                    child: Container(
                                      width: double.infinity,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: Color(0xffeeeeee),
                                        image: _selectedImage != null
                                            ? DecorationImage(
                                          image: FileImage(_selectedImage!),
                                          fit: BoxFit.contain,
                                        )
                                            : null,
                                      ),
                                      child: _selectedImage == null
                                          ? Icon(Icons.image_outlined, size: 40)
                                          : null,
                                    ),
                                  ),

                                  // ======================================
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
                                    onPressed: () async{
                                      // _handleCar;
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

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('갤러리에서 선택'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('카메라로 촬영'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

}
