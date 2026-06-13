import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_bloc/login/bloc/login_bloc.dart';
import 'package:my_bloc/login/bloc/login_event.dart';
import 'package:my_bloc/login/bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // MediaQury taaki har phone ki screen ke mutabiq dynamic spacing ho
    final screenSize = MediaQuery.of(context).size;

    return BlocProvider.value(
      value: _loginBloc,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<LoginBloc, LoginState>(
          listenWhen: (previous, current) => previous.loginStatus != current.loginStatus,
          listener: (context, state) {
            if (state.loginStatus == LoginStatus.error) {
              _showCustomSnackBar(context, state.message.isNotEmpty ? state.message : 'Error', Colors.redAccent);
            } else if (state.loginStatus == LoginStatus.sucess) {
              _showCustomSnackBar(context, 'Welcome Back! Successfully Logged In', Colors.green);
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, // Scroll karne par keyboard hide ho jaye
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenSize.height * 0.08),
                    
                    // 🌟 BRANDING HEADER
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Iconsax.user_tick, size: 50, color: Colors.deepPurple),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Center(
                      child: Text(
                        'Let\'s Sign You In',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Welcome back, you\'ve been missed!',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    
                    SizedBox(height: screenSize.height * 0.06),
                    
                    // 📝 INPUT FIELDS
                    const Text('Email Address', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54)),
                    const SizedBox(height: 8),
                    _buildEmailField(),
                    
                    const SizedBox(height: 20),
                    
                    const Text('Password', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54)),
                    const SizedBox(height: 8),
                    _buildPasswordField(),
                    
                    // 🔗 FORGOT PASSWORD (Realistic App Feature)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password?', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w600)),
                      ),
                    ),
                    
                    SizedBox(height: screenSize.height * 0.04),
                    
                    // 🎯 LOGIN BUTTON
                    Center(child: _buildLoginButton()),
                    
                    const SizedBox(height: 24),
                    
                    // 👥 REGISTER LINK
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account? ', style: TextStyle(color: Colors.grey)),
                        GestureDetector(
                          onTap: () {},
                          child: const Text('Register', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          focusNode: _emailFocus,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocus), // Action: Move to password
          style: const TextStyle(fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.direct_right, size: 22),
            hintText: 'name@example.com',
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
          ),
          onChanged: (value) => context.read<LoginBloc>().add(EmailChanged(email: value)),
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.isPasswordObsecure != current.isPasswordObsecure,
      builder: (context, state) {
        return TextFormField(
          focusNode: _passwordFocus,
          obscureText: state.isPasswordObsecure,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => _passwordFocus.unfocus(), // Action: Hide keyboard
          style: const TextStyle(fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.password_check, size: 22),
            hintText: '••••••••••••',
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            suffixIcon: IconButton(
              onPressed: () => context.read<LoginBloc>().add(TogglePassword()),
              icon: Icon(
                state.isPasswordObsecure ? Iconsax.eye_slash : Iconsax.eye,
                color: Colors.grey,
                size: 22,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
          ),
          onChanged: (value) => context.read<LoginBloc>().add(PasswordChange(password: value)),
        );
      },
    );
  }

  Widget _buildLoginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.loginStatus != current.loginStatus,
      builder: (context, state) {
        final isLoading = state.loginStatus == LoginStatus.loading;
        
        return Container(
          width: double.infinity, // Realistic button full-width hote hain taaki thumb reach aasan ho
          height: 56, // Size bada kiya premium feel ke liye
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 4), // 3D soft shadow effect
              )
            ],
          ),
          child: ElevatedButton(
            onPressed: isLoading ? null : () => context.read<LoginBloc>().add(LoginApi()),
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: Colors.deepPurple,
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 0, // Manual shadow handle ki hai upar container me
            ),
            child: isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.5,
                    ),
                  )
                : const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0.5),
                  ),
          ),
        );
      },
    );
  }

  // 🎨 Real App SnackBars (Smooth animations ke sath niche center hoti hain)
  void _showCustomSnackBar(BuildContext context, String message, Color bgColor) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating, // Floating look
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 3),
          content: Row(
            children: [
              Icon(bgColor == Colors.green ? Icons.check_circle : Icons.error, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
  }
}