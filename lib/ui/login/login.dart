import 'package:flutter/material.dart';
import 'package:kexie_app/gen/assets.gen.dart';

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: "");
    final TextEditingController studentIdController =
        TextEditingController(text: "");
    FocusScopeNode? focusScopeNode;
    final GlobalKey formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image(
                  image: AssetImage(Assets.image.loginfailHeadimage.path),
                  height: 180,
                  width: 180,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                '三院科协',
                textScaleFactor: 2.5,
              ),
              const SizedBox(
                height: 35,
              ),
              Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: "姓名",
                          hintText: "输入您的姓名",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        validator: (v) {
                          return v!.trim().isNotEmpty ? null : "姓名不能为空";
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: "学号",
                          hintText: "输入您的学号",
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        validator: (v) {
                          return v!.trim().isNotEmpty ? null : "学号不能为空";
                        },
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[100],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              minimumSize: const Size(double.infinity, 50)),
                          child: const Text('登录')),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
