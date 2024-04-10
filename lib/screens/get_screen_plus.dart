// ignore_for_file: deprecated_member_use

import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:project_trustmebro/utils/colors.dart";

class GetScreen extends StatefulWidget {
  const GetScreen({Key? key}) : super(key: key);

  @override
  _GetScreenState createState() => _GetScreenState();
}

class _GetScreenState extends State<GetScreen> {
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  var _prodMaxLen = 20;
  var _descMaxLen = 400;

  @override
  void dispose() {
    super.dispose();
    _productController.dispose();
    _descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          centerTitle: false,
          actions: [],
        ),
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Flexible(child: Container(), flex: 2),

          // add smth to show add profiles
          SvgPicture.asset(
            'assets/borrow_post.svg',
            color: secondaryColor,
            height: 200,
          ),

          const SizedBox(
            height: 24,
          ),

          TextField(
            controller: _productController,
            maxLength: _prodMaxLen,
            decoration: InputDecoration(
              labelText: 'Enter Product Name (max $_prodMaxLen characters)',
              counterText: '',
            ),
          ),

          const SizedBox(height: 24),

          TextField(
            controller: _descController,
            maxLength: _descMaxLen,
            decoration: InputDecoration(
              labelText: 'Enter description (max $_descMaxLen characters)',
              counterText: '',
            ),
          ),

          const SizedBox(height: 24),

          InkWell(
            child: Container(
              child: const Text('Request'),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                color: primaryColor,
              ),
            ),
          ),

          const SizedBox(height: 250),
        ]),
      ),
    ));
  }
}
