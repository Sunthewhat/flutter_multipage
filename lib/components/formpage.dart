import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab4_multipage/components/displaypage.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String name = '';
  String id = '';
  String email = '';
  bool _isEmailValid = true;
  bool _isIdValid = true;

  @override
  Widget build(BuildContext context) {
    bool validate(String email) {
      bool isvalid = EmailValidator.validate(email);
      setState(() {
        _isEmailValid = isvalid;
        _isIdValid = id.length == 11;
      });
      return isvalid && id.length == 11;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Give me your info!!!"),
                const SizedBox(height: 20),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      name = text;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (text) {
                    setState(() {
                      id = text;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'ID',
                    hintText: 'Enter your ID',
                    border: OutlineInputBorder(),
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (text) {
                    setState(() {
                      email = text;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: _isEmailValid
                      ? const Text('')
                      : const Text(
                          'Please enter a valid email',
                          style: TextStyle(color: Colors.red),
                        ),
                ),
                SizedBox(
                  height: 20,
                  child: _isIdValid
                      ? const Text('')
                      : const Text(
                          'Please enter a valid ID',
                          style: TextStyle(color: Colors.red),
                        ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      bool valid = validate(email);
                      if (valid) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DisplayPage(
                                      name: name,
                                      id: id,
                                      email: email,
                                    )));
                      }
                    },
                    child: const Text('Submit'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
