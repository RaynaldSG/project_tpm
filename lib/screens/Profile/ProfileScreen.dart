import 'dart:io' as i;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_tpm/controller/SharedPreferenceController.dart';
import 'package:project_tpm/controller/UserController.dart';
import 'package:project_tpm/model/UserModel.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';
import 'package:project_tpm/utils/image/ImagePickerHelper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserController userController = UserController();
  late String imagePath;
  late UserModel userData;

  @override
  void initState() {
    userData = userController.getUser()!;
    imagePath = userData.imageLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: ColorPallete.secondaryColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                SharedPreferenceController.sharedPrefData
                    .setBool('login', false);
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildInfoCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              imagePath = await ImagePickerHelper().pickImage();
              userData.imageLocation = imagePath;
              userController.setUser(userData);
              setState(() {});
            },
            child: CircleAvatar(
              radius: 100,
              backgroundImage: imagePath.isEmpty
                  ? const AssetImage('assets/images/profile.jpg')
                  : FileImage(i.File(imagePath)) as ImageProvider,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            userData.fullName,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        color: ColorPallete.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            _buildInfoRow(Icons.email, 'Email', userData.email),
            _buildInfoRow(Icons.message, 'Saran',
                'Saran saya adalah bahwa untuk materi jika bisa disinkronkan dengan praktikum agar pengerjaan tugas dan project dapat dikerjakan dengan lebih mudah.'),
            _buildInfoRow(Icons.comment, 'Kesan',
                'Kesan saya, cukup menyenangkan untuk belajar mata kuliah Teknologi Pemrograman Mobile, ilmu yang didapat bisa digunakan untuk merancang aplikasi mobile yang kita butuhkan'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(width: 250, child: Text(value)),
            ],
          ),
        ],
      ),
    );
  }
}
