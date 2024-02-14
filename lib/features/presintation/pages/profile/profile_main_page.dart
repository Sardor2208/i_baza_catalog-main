import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:i_baza_catalog/features/presintation/pages/profile/profile.dart';
import 'package:image_picker/image_picker.dart';

// Conditionally import 'dart:io' or 'dart:html'
// For simplicity, this example assumes 'dart:io', but you should adjust based on your target platform
import 'dart:io';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({super.key});

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  File? avatar;
  String _name = '';
  String _location = '';

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    // Ensure that Hive is initialized and the boxes are opened elsewhere in your code
    final nameBox = Hive.box("profile_name");
    final locationBox = Hive.box("profile_location");
    final name = await nameBox.get(1, defaultValue: 'Name not set');
    final location = await locationBox.get(1, defaultValue: 'Location not set');
    final avatarBox = Hive.box("profile_avatar");
    final avatarPath = avatarBox.get('avatar_path');
    if (avatarPath != null) {
      setState(() {
        avatar = File(avatarPath);
      });
    }

    setState(() {
      _name = name;
      _location = location;
    });
  }

  Future<void> pickerAvatar() async {
    ImagePicker imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        avatar = File(file.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> nameParts = _name.split(' ');
    return Scaffold(
      backgroundColor: Color(0xFFF5F8FC),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 68,left: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Positioned(
                      child: Container(
                        height: 70,
                        width: 70,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: avatar == null
                            ? const Icon(Icons.person, size: 30, color: Colors.grey)
                            : Image.file(avatar!, fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 16,),
                    SizedBox(
                      width: 200,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${nameParts[0]} ',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
                            ),
                            if (nameParts.length > 1)
                              TextSpan(
                                text: nameParts.sublist(1).join(' '),
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey),
                              ),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: 50,),

                    Positioned(
                      right: 20,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24,),
                Row(
                  children: [
                    Container(
                      height: 94,
                      width: 101,
                      decoration: BoxDecoration(
                        color: Colors.white, // White background as specified
                        borderRadius: BorderRadius.circular(16), // Circular shape
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 16,),
                          SvgPicture.asset("assets/Heart.svg", // Replace with your SVG asset path
                              fit: BoxFit.cover),
                          SizedBox(height: 12,),
                          Text('Saqlanganlar', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: Colors.black)),
                        ],
                      )
                    ),
                    SizedBox(width: 32,),

                    Container(
                        height: 94,
                        width: 101,
                        decoration: BoxDecoration(
                          color: Colors.white, // White background as specified
                          borderRadius: BorderRadius.circular(16), // Circular shape
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 16,),
                            SvgPicture.asset("assets/Notification - 3.svg", // Replace with your SVG asset path
                                fit: BoxFit.cover),
                            SizedBox(height: 12,),
                            Text('Xabarnomalar', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: Colors.black)),
                          ],
                        )
                    ),
                    SizedBox(width: 32,),
                    Container(
                        height: 94,
                        width: 101,
                        decoration: BoxDecoration(
                          color: Colors.white, // White background as specified
                          borderRadius: BorderRadius.circular(16), // Circular shape
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 16,),
                            SvgPicture.asset("assets/Setting.svg", // Replace with your SVG asset path
                                fit: BoxFit.cover),
                            SizedBox(height: 12,),
                            Text('Sozlamalar', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: Colors.black)),
                          ],
                        )
                    ),
                  ],
                ),
                SizedBox(height: 24,),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        width: double.infinity,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                          child: Row(
                            children: [
                              SizedBox(width: 8,),
                              SvgPicture.asset("assets/profile_icons/Note.svg", fit: BoxFit.cover),
                              SizedBox(width: 12,),
                              Text('Yo‘riqnoma', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black)),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                          width: double.infinity,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 8,),
                              SvgPicture.asset("assets/profile_icons/iBaza.svg", fit: BoxFit.cover),
                              SizedBox(width: 12,),
                              Text('Ilova haqida', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black)),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                          width: double.infinity,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 8,),
                              SvgPicture.asset("assets/profile_icons/Info.svg", fit: BoxFit.cover),
                              SizedBox(width: 12,),
                              Text('Foydalanish qoidalari', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black)),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                          width: double.infinity,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 8,),
                              SvgPicture.asset("assets/profile_icons/Info copy.svg", fit: BoxFit.cover),
                              SizedBox(width: 12,),
                              Text('Bonus balansi', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black)),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                          width: double.infinity,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 8,),
                              SvgPicture.asset("assets/profile_icons/Info copy 2.svg", fit: BoxFit.cover),
                              SizedBox(width: 12,),
                              Text('Yordam', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black)),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          )
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
