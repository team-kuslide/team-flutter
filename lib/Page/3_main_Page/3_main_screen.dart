import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  File? _image;
  bool _isAnimatedOpacity = false;
  bool _isAnimatedOpacity2 = false;
  String _isUsearInputValue = '여기를 클릭해 글로 자신을 소개해 보세요!';
  bool _isTesting = false;

  Future<void> pickImage(BuildContext context) async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        print('이미지 선택됨: ${pickedFile.path}');
        File? croppedFile = await cropImage(File(pickedFile.path));
        if (croppedFile != null) {
          setState(() {
            _image = croppedFile;
          });

          print('이미지 자르기 완료: ${croppedFile.path}');
          await Future.delayed(const Duration(milliseconds: 600));
          setState(() {
            _isAnimatedOpacity = true;
          });
        } else {
          print('이미지 자르기 취소됨');
        }
      } else {
        print('이미지 선택 취소됨');
      }
    } catch (e) {
      print('이미지 선택 에러: $e');
      showPermissionRequestDialog(context);
    }
  }

  Future<File?> cropImage(File imageFile) async {
    try {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: '이미지 자르기',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: '이미지 자르기',
          ),
        ],
      );

      if (croppedFile != null) {
        return File(croppedFile.path);
      }
      return null;
    } catch (e) {
      print('이미지 자르기 에러: $e');
      return null;
    }
  }

  void showPermissionRequestDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("권한 필요"),
        content: const Text("사진을 선택하기 위해서는 사진 접근 권한이 필요합니다. 설정에서 권한을 허용해주세요."),
        actions: [
          TextButton(
            onPressed: () {
              openAppSettings();
            },
            child: const Text("설정으로 이동"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("취소"),
          ),
        ],
      ),
    );
  }

  void _screentoggle() async {
    setState(() {
      _isAnimatedOpacity2 = true;
    });
    await Future.delayed(const Duration(milliseconds: 700));
    _focusNode.requestFocus();
  }

  void _screentoggleClose(String userInputValue) async {
    _isUsearInputValue = userInputValue;
    setState(() {
      _isAnimatedOpacity2 = false;
    });
    if (userInputValue.isNotEmpty) {
      setState(() {
        _isTesting = true;
      });
    } else {
      setState(() {
        _isTesting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {
          _isAnimatedOpacity2 = false;
        });
        if (_textController.text.isNotEmpty) {
          setState(() {
            _isTesting = true;
          });
        } else {
          setState(() {
            _isTesting = false;
          });
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFFDFDFD),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * 0.1),
                          Container(
                            width: screenWidth * 0.75,
                            height: screenHeight * 0.5,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 10,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                AnimatedOpacity(
                                  opacity: _isAnimatedOpacity2 ? 0.0 : 1.0,
                                  duration: const Duration(milliseconds: 420),
                                  child: IgnorePointer(
                                    ignoring: _isAnimatedOpacity2,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              pickImage(context);
                                            },
                                            child: _image != null
                                                ? Image.file(
                                                    _image!,
                                                    width: screenWidth * 0.75,
                                                    height: screenHeight * 0.4,
                                                    fit: BoxFit.cover,
                                                  )
                                                : SizedBox(
                                                    width: screenWidth * 0.75,
                                                    height: screenHeight * 0.4,
                                                    child: const Center(
                                                      child: Text(
                                                        '아래의 + 버튼을 클릭하거나\n 여기를 클릭해 사진을 추가해주세요',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                          const Divider(
                                              height: 2, color: Colors.grey),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText: _isUsearInputValue,
                                                hintStyle: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                                border: InputBorder.none,
                                              ),
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //-------------------------------
                                AnimatedOpacity(
                                  opacity: !_isAnimatedOpacity2 ? 0.0 : 1.0,
                                  duration: const Duration(milliseconds: 620),
                                  child: IgnorePointer(
                                    ignoring: !_isAnimatedOpacity2,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: TextFormField(
                                              onFieldSubmitted: (value) {
                                                _screentoggleClose(value);
                                              },
                                              onChanged: (value) {
                                                _isUsearInputValue = value;
                                              },
                                              textInputAction:
                                                  TextInputAction.done,
                                              controller: _textController,
                                              focusNode: _focusNode,
                                              decoration: const InputDecoration(
                                                hintText:
                                                    '사진과 함께 짧은 글을 통해 자신을 소개해 보세요!',
                                                hintStyle: TextStyle(
                                                  fontSize: 14,
                                                ),
                                                border: InputBorder.none,
                                              ),
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          const Divider(
                                              height: 2, color: Colors.grey),
                                          InkWell(
                                            onTap: () {
                                              pickImage(context);
                                            },
                                            child: _image != null
                                                ? Image.file(
                                                    _image!,
                                                    width: screenWidth * 0.75,
                                                    height:
                                                        screenHeight * 0.411,
                                                    fit: BoxFit.cover,
                                                  )
                                                : SizedBox(
                                                    width: screenWidth * 0.75,
                                                    height: screenHeight * 0.4,
                                                    child: const Center(
                                                      child: Text(
                                                        '아래의 + 버튼을 클릭하거나\n 여기를 클릭해 사진을 추가해주세요',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          AnimatedOpacity(
                            opacity: _isAnimatedOpacity ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 450),
                            child: const Text(
                              '선택된 이미지를 클릭하면\n이미지를 변경하거나 수정할 수 있어요\n\n ',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.15),
                          const Divider(
                            height: 1,
                          ),
                          const Divider(
                            height: 1,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.08,
                      right: screenWidth * 0.085,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: const ShapeDecoration(
                          color: Colors.black,
                          shape: CircleBorder(),
                          shadows: [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 10,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.502,
                      left: screenWidth * 0.122,
                      child: IgnorePointer(
                        ignoring: _isAnimatedOpacity2,
                        child: InkWell(
                          onTap: () {
                            _screentoggle();
                          },
                          child: Container(
                            width: screenWidth * 0.75,
                            height: screenHeight * 0.09,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: AnimatedOpacity(
                  opacity: !_isAnimatedOpacity ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 450),
                  child: IgnorePointer(
                    ignoring: _isAnimatedOpacity,
                    child: SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x0C000000),
                              blurRadius: 8,
                              offset: Offset(0, -2),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: const Row(
                          children: [
                            Spacer(),
                            Icon(
                              Icons.message,
                              size: 32,
                              color: Color(0xffc1c1c1),
                              //color: Color(0xff6fbf8a),
                            ),
                            Spacer(),
                            SizedBox(width: 100),
                            Icon(
                              Icons.person_outline,
                              size: 32,
                              color: Color(0xffc1c1c1),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: screenHeight * 0.01,
                right: screenWidth * 0.38,
                child: GestureDetector(
                  onTap: () {
                    pickImage(context);
                  },
                  child: AnimatedOpacity(
                    opacity: !_isAnimatedOpacity ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 450),
                    child: IgnorePointer(
                      ignoring: _isAnimatedOpacity,
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          shadows: [
                            BoxShadow(
                              color: Color(0x19000000),
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              _isTesting
                  ? Positioned(
                      bottom: screenHeight * 0.02,
                      right: screenWidth * 0.29,
                      child: GestureDetector(
                        onTap: () {
                          pickImage(context);
                        },
                        child: AnimatedOpacity(
                            opacity: _isAnimatedOpacity ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 450),
                            child: IgnorePointer(
                              ignoring: !_isAnimatedOpacity,
                              child: Container(
                                width: 180,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffFFAE88),
                                      Color(0xff8F93EA)
                                    ],
                                  ),
                                ),
                                child: MaterialButton(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: const StadiumBorder(),
                                  onPressed: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          '자기소개 등록하기',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
