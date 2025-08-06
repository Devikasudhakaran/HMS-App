import 'package:flutter/material.dart';
import 'package:hms/application/features/widgets/text_field.dart';

import '../widgets/appbar.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController NameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarr(
        showNotificationIcon: true,
      ),
      body: Column(
        children: [
          Align(
              alignment: Alignment(-0.8,0),
              child: Text("Register", style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.black),)),
          Divider(),
          const SizedBox(height: 25),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(vertical: 8.0),
             // alignment: Alignment.centerLeft,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                      label: "Name",
                      hint: "Enter you full name",
                    controller: NameCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is required";
                      }

                      return null;
                    },
                  ),
                  CustomTextField(
                    label: "Whatsapp Number",
                    hint: "Enter you Whatsapp Number",
                    controller: NameCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Whatsapp Number is required";
                      }

                      return null;
                    },
                  ),
                  CustomTextField(
                    label: "Adderss",
                    hint: "Enter you full address",
                    controller: NameCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return " is required";
                      }

                      return null;
                    },
                  ),
                ],
              ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
