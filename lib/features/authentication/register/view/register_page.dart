import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:vr_project/core/generics/recource.dart';

import '../../login/view/login_page.dart';
import '../controller/register_cotroller.dart';

class RegiterPage extends StatelessWidget {
  RegiterPage({Key? key}) : super(key: key);

  final _controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 48),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Hero(
                    child: Image.asset('lib/Assets/calendar_logo.png'),
                    tag: 'app-logo'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                'Register',
                style: GoogleFonts.roboto(
                    fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Observer(builder: (_) {
                    return TextField(
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          hintStyle: GoogleFonts.roboto(),
                          fillColor: const Color.fromARGB(255, 217, 217, 217),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onChanged: _controller.changeFirstName);
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: GoogleFonts.roboto(),
                        fillColor: const Color.fromARGB(255, 217, 217, 217),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onChanged: _controller.changeLastName,
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                        hintText: 'E-Mail',
                        hintStyle: GoogleFonts.roboto(),
                        fillColor: const Color.fromARGB(255, 217, 217, 217),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onChanged: _controller.ChangeEmail,
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: GoogleFonts.roboto(),
                        fillColor: const Color.fromARGB(255, 217, 217, 217),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onChanged: _controller.changePassword,
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: GoogleFonts.roboto(),
                        fillColor: const Color.fromARGB(255, 217, 217, 217),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onChanged: _controller.changeConfirmPassword,
                    );
                  }),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  Observer(builder: (_) {
                    bool isLoading = _controller.isButtonLoading;
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: ElevatedButton(
                        style: const ButtonStyle(),
                        onPressed: _controller.areCredentialsValid
                            ? () async {
                                _controller.setButtonToLoading();
                                final resource =
                                    await _controller.registerUser();
                                if (resource.hasError) {
                                  await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              elevation: 10,
                                              backgroundColor:
                                                  const Color.fromARGB(255, 255, 255, 255),
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Text(
                                                    resource.error!,
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.bold, fontSize: 22),
                                                  ),
                                                ),
                                              ),
                                            );
                                          })
                                      .then((_) =>
                                          _controller.isButtonLoading = false);
                                }
                                if (resource.status == Status.success) {
                                  await Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                }
                              }
                            : null,
                        child: isLoading
                            ? Container(
                                width: 24,
                                height: 24,
                                color: Colors.transparent,
                                child: Lottie.asset(
                                    "lib/Assets/99680-3-dots-loading.json"))
                            : Text(_controller.areCredentialsValid
                                ? 'Entrar'
                                : "Credenciais Invàlidas"),
                      ),
                    );
                  }),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
