import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:vr_project/features/authentication/home_page.dart/view/home_page_view.dart';

import '../../../../core/generics/recource.dart';
import '../../register/view/register_page.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final _controller = LoginController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Hero(
                    child: Image.asset('lib/Assets/calendar_logo.png'),
                    tag: 'app-logo'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                'Login',
                style: GoogleFonts.roboto(
                    fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Observer(builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
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
                      onChanged: _controller.changeEmail,
                    );
                  }),
                  const SizedBox(height: 16),
                  Observer(builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
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
                      onChanged: _controller.changePassword,
                    );
                  }),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Observer(builder: (_) {
                    bool isLoading = _controller.isButtonAtLoadingStatus;
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: ElevatedButton(
                        style: const ButtonStyle(),
                        onPressed: _controller.areCredencialsValid
                            ? () async {
                                _controller.setButtonToLoadingStatus();
                                final resource = await _controller.loginUser();
                                if (resource.hasError) {
                                  await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              backgroundColor: Colors.amber,
                                              child: Text(resource.error!),
                                            );
                                          })
                                      .then((_) => _controller
                                          .isButtonAtLoadingStatus = false);
                                }
                                if (resource.status == Status.success) {
                                  await Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                }
                              }
                            : null,
                        child: isLoading
                            ? Container(
                                width: 24,
                                height: 24,
                                child: Lottie.network(
                                    "https://assets7.lottiefiles.com/packages/lf20_yfrk3mpo.json"))
                            : Text(_controller.areCredencialsValid
                                ? 'Entrar'
                                : "Credenciais Invàlidas"),
                      ),
                    );
                  }),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  InkWell(
                    onTap: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegiterPage()));
                  },
                    child: const Text('Register'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
