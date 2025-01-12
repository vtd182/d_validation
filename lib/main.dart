import 'package:d_validation/d_validation.dart';
import 'package:d_validation/src/base_model.dart';
import 'package:flutter/material.dart';

class UserModel extends BaseModel<UserModel> {
  final String email;
  final String password;
  final int age;
  final String phone;

  UserModel({
    required this.email,
    required this.password,
    required this.age,
    required this.phone,
  }) : super();

  @override
  void defineRules(BaseValidator<UserModel> validator) {
    validator
      ..ruleFor((user) => user.email, key: 'email').notEmpty().validEmail().cascade(CascadeMode.stopOnFirstFailure)
      ..ruleFor((user) => user.age, key: 'age').min(18, message: 'Age must be at least 18')
      ..ruleFor((user) => user.phone, key: 'phone').notEmpty()
      ..ruleFor((user) => user.password, key: 'password').notEmpty().minLength(6, message: 'Password must be at least 6 characters');
  }
}

// Màn hình chính với DValidateEmailTextField
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  String email = '';

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DValidateEmailTextField(
              label: 'Email',
              keyField: 'email',
              controller: _emailController,
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Xử lý khi người dùng bấm nút
                if (email.isNotEmpty && !email.contains('@')) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Email không hợp lệ')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Email hợp lệ')),
                  );
                }
              },
              child: Text('Xác nhận'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  try {
    UserModel user = UserModel(
      email: "invalid",
      password: "123",
      age: 17,
      phone: "",
    );
  } catch (e) {
    print("Validation failed: $e");
  }
}

// MyApp - Ứng dụng chính
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
