import 'package:binsense/components/ui/button_ui.dart';
import 'package:binsense/components/ui/text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homelayout extends StatefulWidget {
  const Homelayout({super.key});

  @override
  State<Homelayout> createState() => _HomelayoutState();
}

class _HomelayoutState extends State<Homelayout> {

  final ipController = TextEditingController();
  get onTap => null;

  void errorMessage(String message) {
    showDialog(context: context, builder: (context){
      return  AlertDialog(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      );
    });
  }

 void connectnew() async {
    final ip = ipController.text;
    if (ip.isEmpty) {
      errorMessage('IP Address cannot be empty');
      return;
    }

    // Save IP address to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ipAddress', ip);

    // Do other tasks related to connecting using the new IP address
    print('Connected using IP: $ip');
  }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
            'BinSense',
            style: TextStyle(
            color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold

        ),
      ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(height: 25),
              const Image(
                image: AssetImage('assets/logo/flc.png'),
                  width: 100,
                  height: 100,
                  color: null,
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 25,),
                
                MyButton(onTap:connectnew, text: "Start a Sever"),
                const SizedBox(height:25),
                const Divider(
                  thickness: 0.5,
                  color: Colors.white,
                ),

                const SizedBox(height: 25),
                
                // username textfield
                MyTextField(
  controller: ipController,
  hintText: 'IP-Address',
  obscureText: false,
),
                const SizedBox(height: 25),
                MyButton(onTap:connectnew, text: "Connect to server"),


            ],

          ),
        ),
      ),
    );
  }
}