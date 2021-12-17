import 'package:atm_mlm_app/view/home_page.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> with InputValidationMixin {
  final formGlobalKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _districtController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _nameController = TextEditingController(text: widget.user.name);
    // _occupationController = TextEditingController(text: widget.user.occupation);
    // _stateController = TextEditingController(text: widget.user.state);
    // _phoneController = TextEditingController(text: widget.user.phone);
    // _districtController = TextEditingController(text: widget.user.district);
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController _emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: formGlobalKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          TextFormField(
                            // initialValue: user.name,
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                            ),
                            validator: (name) {
                              if (isFieldValid(name!)) {
                                return null;
                              } else {
                                return 'Enter a valid name';
                              }
                            },
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: _stateController,
                            // initialValue: user.state,
                            decoration: const InputDecoration(
                              labelText: "Prant/State",
                            ),
                            validator: (prant) {
                              if (isFieldValid(prant!)) {
                                return null;
                              } else {
                                return 'Enter a valid Prant/State';
                              }
                            },
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: _districtController,
                            // initialValue: user.district,
                            decoration: const InputDecoration(
                              labelText: "District",
                            ),
                            validator: (prant) {
                              if (isFieldValid(prant!)) {
                                return null;
                              } else {
                                return 'Enter a valid District';
                              }
                            },
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            // onChanged: (value) {
                            //   _occupationController.text = value;
                            // },
                            controller: _occupationController,
                            // initialValue: user.occupation,
                            decoration: const InputDecoration(
                              labelText: "Occupation",
                            ),
                            validator: (occupation) {
                              if (isFieldValid(occupation!)) {
                                return null;
                              } else {
                                return 'Enter a valid Occupation';
                              }
                            },
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            // initialValue: user.phone,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                            ),
                            controller: _phoneController,
                            validator: (contact) {
                              if (isPhoneNumberValid(contact!)) {
                                return null;
                              } else {
                                return 'Enter a valid Contact Number';
                              }
                            },
                          ),
                          const SizedBox(height: 24),
                          // const SizedBox(height: 50),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xEFF7007C),
                                ),
                              ),
                              onPressed: () async {
                                if (formGlobalKey.currentState!.validate()) {
                                  // widget.user.name = _nameController.text;
                                  // // TODO uncomment the below lines
                                  // widget.user.occupation = _occupationController.text;
                                  // widget.user.state = _stateController.text;
                                  // widget.user.phone = _phoneController.text;
                                  // widget.user.district = _districtController.text;
                                  try {
                                    // await UserService.updateUser(widget.user);
                                    formGlobalKey.currentState!.save();
                                    // Navigator.pop(context);
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage(),
                                        ),
                                        (route) => false);
                                  } catch (e) {
                                    // print(e.toString());
                                  }
                                  // Navigator.popAndPushNamed(context, routeName);
                                  // use the email provided here
                                }
                              },
                              child: const Text("Submit"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

mixin InputValidationMixin {
  bool isFieldValid(String fieldData) => fieldData.isNotEmpty;
  bool isPhoneNumberValid(String fieldData) => fieldData.length == 10;

  bool isEmailValid(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
