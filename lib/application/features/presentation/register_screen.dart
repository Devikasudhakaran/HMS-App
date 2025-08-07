import 'package:flutter/material.dart';
import 'package:hms/application/features/widgets/text_field.dart';

import '../components/addtreatment_card.dart';
import '../components/treatment_card.dart';
import '../widgets/appbar.dart';
import '../widgets/dropdown.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final whatsappCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final totalAmountCtrl = TextEditingController();
  final discountCtrl = TextEditingController();
  final advanceCtrl = TextEditingController();
  final balanceCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final hourCtrl = TextEditingController();
  final minuteCtrl = TextEditingController();

  String? selectedHour;
  String? selectedMinutes;
  String? selectedLocation;
  String? selectedBranch;
  String? selectedPayment = 'Cash';

  final List<String> locationOptions = ['Kochi', 'Thrissur', 'Palakkad', 'Calicut'];
  final List<String> branchOptions = ['Branch 1', 'Branch 2'];
  final List<String> hourOptions = List.generate(24, (i) => i.toString().padLeft(2, '0'));
  final List<String> minuteOptions = List.generate(60, (i) => i.toString().padLeft(2, '0'));

  final List<TreatmentCard> treatments = [];

  void _addTreatment() {
    setState(() {
      treatments.add(const TreatmentCard());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarr(showNotificationIcon: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment(-0.8, 0),
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              const SizedBox(height: 20),

              CustomTextField(
                label: "Name",
                hint: "Enter your full name",
                controller: nameCtrl,
              ),

              CustomTextField(
                label: "Whatsapp Number",
                hint: "Enter your Whatsapp Number",
                controller: whatsappCtrl,
              ),

              CustomTextField(
                label: "Address",
                hint: "Enter your full address",
                controller: addressCtrl,
              ),

              CustomDropdown<String>(
                label: "Location",
                hint: "Select a location",
                value: selectedLocation,
                items: locationOptions.map((location) {
                  return DropdownMenuItem(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLocation = value;
                  });
                },
              ),

              const SizedBox(height: 10),

              CustomDropdown<String>(
                label: "Branch",
                hint: "Select a branch",
                value: selectedBranch,
                items: branchOptions.map((branch) {
                  return DropdownMenuItem(
                    value: branch,
                    child: Text(branch),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedBranch = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              const Text("Treatments", style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              ...treatments.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: e,
              )),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade100),
                  onPressed: () => showAddTreatmentDialog(context),
                  child: const Text("+ Add Treatments"),
                ),
              ),

              const SizedBox(height: 20),

              CustomTextField(
                label: "Total Amount",
                hint: "Enter total amount",
                controller: totalAmountCtrl,
                keyboardType: TextInputType.number,
              ),

              CustomTextField(
                label: "Discount Amount",
                hint: "Enter discount amount",
                controller: discountCtrl,
                keyboardType: TextInputType.number,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Payment Option"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Cash',
                        groupValue: selectedPayment,
                        onChanged: (value) {
                          setState(() {
                            selectedPayment = value;
                          });
                        },
                      ),
                      const Text("Cash"),
                    ],
                  ),

                  Row(
                    children: [
                      Radio<String>(
                        value: 'Card',
                        groupValue: selectedPayment,
                        onChanged: (value) {
                          setState(() {
                            selectedPayment = value;
                          });
                        },
                      ),
                      const Text("Card"),
                    ],
                  ),

                  Row(
                    children: [
                      Radio<String>(
                        value: 'UPI',
                        groupValue: selectedPayment,
                        onChanged: (value) {
                          setState(() {
                            selectedPayment = value;
                          });
                        },
                      ),
                      const Text("UPI"),
                    ],
                  ),

                ],
              ),

              CustomTextField(
                label: "Advance Amount",
                hint: "Enter advance amount",
                controller: advanceCtrl,
                keyboardType: TextInputType.number,
              ),

              CustomTextField(
                label: "Balance Amount",
                hint: "Enter balance amount",
                controller: balanceCtrl,
                keyboardType: TextInputType.number,
              ),

              CustomTextField(
                label: "Treatment Date",
                hint: '',
                controller: dateCtrl,
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    dateCtrl.text = "${picked.toLocal()}".split(' ')[0];
                  }
                },
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Treatment Time", style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),),
                    Row(
                      children: [
                        Expanded(
                          child:
                          CustomDropdown<String>(
                            label: "",
                            hint: "Hour",
                            value: selectedHour,
                            items: locationOptions.map((hour) {
                              return DropdownMenuItem(
                                value: hour,
                                child: Text(hour),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedHour = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child:  CustomDropdown<String>(
                            label: "",
                            hint: "Minutes",
                            value: selectedMinutes,
                            items: locationOptions.map((min) {
                              return DropdownMenuItem(
                                value: min,
                                child: Text(min),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedMinutes = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Submit logic
                    }
                  },
                  child: const Text("Save", style: TextStyle(fontSize: 18.5,fontWeight: FontWeight.w600,color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

