import 'package:careerclub/models/user_data_model.dart';
import 'package:careerclub/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../models/constants.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final UserDataModel userData;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController revaMailController = TextEditingController();
  final TextEditingController srnController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  FocusNode fNameFocus = FocusNode();
  FocusNode revaMailFocus = FocusNode();
  FocusNode srnFocus = FocusNode();
  FocusNode phoneNumberFocus = FocusNode();

  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    fNameController.text = widget.userData.fName!;
    revaMailController.text = widget.userData.revaMail!;
    srnController.text = widget.userData.srn!;
    phoneNumberController.text = widget.userData.phoneNumber!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: darkColor,
        title: const Text("Profile"),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: isEdit
              ? _editUser(
                  fNameFocus: fNameFocus,
                  fNameController: fNameController,
                  revaMailFocus: revaMailFocus,
                  revaMailController: revaMailController,
                  srnFocus: srnFocus,
                  srnController: srnController,
                  phoneNumberFocus: phoneNumberFocus,
                  phoneNumberController: phoneNumberController,
                  onPressed: () {
                    setState(() {
                      isEdit = false;
                    });
                  },
                )
              : _showProfile(),
        ),
      ),
    );
  }

  Column _showProfile() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            "images/male_avatar.png",
            scale: 3,
          ),
        ),
        const SizedBox(height: 40),
        ProfileText(
          title: widget.userData.fName!,
          icon: Icons.person,
        ),
        const SizedBox(height: 20),
        ProfileText(
          title: widget.userData.srn!,
          icon: Icons.card_membership,
        ),
        const SizedBox(height: 20),
        ProfileText(
          title: widget.userData.phoneNumber!,
          icon: Icons.phone,
        ),
        const SizedBox(height: 20),
        ProfileText(
          title: widget.userData.revaMail!,
          icon: Icons.email,
        ),
        const SizedBox(height: 20),
        IconButton(
          onPressed: () {
            setState(() {
              isEdit = true;
            });
          },
          icon: const Icon(
            Icons.edit,
            color: Colors.yellow,
          ),
        )
      ],
    );
  }
}

class _editUser extends StatelessWidget {
  const _editUser({
    Key? key,
    required this.fNameFocus,
    required this.fNameController,
    required this.revaMailFocus,
    required this.revaMailController,
    required this.srnFocus,
    required this.srnController,
    required this.phoneNumberFocus,
    required this.phoneNumberController,
    required this.onPressed,
  }) : super(key: key);

  final FocusNode fNameFocus;
  final TextEditingController fNameController;
  final FocusNode revaMailFocus;
  final TextEditingController revaMailController;
  final FocusNode srnFocus;
  final TextEditingController srnController;
  final FocusNode phoneNumberFocus;
  final TextEditingController phoneNumberController;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Stack(
              children: [
                Image.asset(
                  "images/male_avatar.png",
                  scale: 3,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {},
                    color: Colors.red,
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          EditTextField(
            focusNode: fNameFocus,
            labelText: "Full Name",
            icon: Icons.person,
            onChanged: (value) {},
            controller: fNameController,
          ),
          const SizedBox(height: 20),
          EditTextField(
            focusNode: revaMailFocus,
            labelText: "Reva Mail",
            icon: Icons.email,
            onChanged: (value) {},
            controller: revaMailController,
          ),
          const SizedBox(height: 20),
          EditTextField(
            focusNode: srnFocus,
            labelText: "SRN",
            icon: Icons.card_membership,
            onChanged: (value) {},
            controller: srnController,
          ),
          const SizedBox(height: 20),
          EditTextField(
            focusNode: phoneNumberFocus,
            labelText: "Phone Number",
            icon: Icons.phone,
            onChanged: (value) {},
            controller: phoneNumberController,
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: onPressed,
              child: const Text("Update"),
            ),
          )
        ],
      ),
    );
  }
}

class EditTextField extends StatelessWidget {
  const EditTextField({
    Key? key,
    required this.focusNode,
    required this.onChanged,
    required this.labelText,
    required this.icon,
    this.controller,
  }) : super(key: key);

  final FocusNode focusNode;
  final Function(String value) onChanged;
  final String labelText;
  final IconData icon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      style: TextStyle(color: focusNode.hasFocus ? Colors.white : Colors.grey),
      decoration: kTextFieldDecoration.copyWith(
          labelText: labelText,
          prefixIcon: Icon(
            icon,
            color: focusNode.hasFocus ? primaryColor : Colors.grey,
          ),
          labelStyle: TextStyle(
            color: focusNode.hasFocus ? primaryColor : Colors.grey,
          )),
    );
  }
}

class ProfileText extends StatelessWidget {
  const ProfileText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(width: 20),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
