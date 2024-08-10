import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/gen/assets.gen.dart';
import 'package:kexie_app/global/global.dart';
import 'package:kexie_app/internet/login.dart';
import 'package:kexie_app/widgets/toast.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: "");
    final TextEditingController studentIdController =
        TextEditingController(text: "");
    var isLoading = false.obs;
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
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image(
                    image: AssetImage(Assets.image.kexieLogo.path),
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                width: 250,
                child: Center(
                  child: Text(
                    '三院科协',
                    style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 8,fontSize: 50),
                  ),
                ),
              ),
              const SizedBox(
                width: 250,
                child: Center(
                  child: Text(
                    'sanyuankexie',
                    style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 2,fontSize: 30),
                  ),
                ),
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
                        controller: studentIdController,
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
                      Obx(
                        () => ElevatedButton(
                            onPressed: () async {
                              if (!isLoading.value) {
                                if ((formKey.currentState as FormState)
                                    .validate()) {
                                  if (Global.user.value.name.toString() ==
                                      nameController.text.toString()) {
                                    toast('此账号已登录');
                                  } else {
                                    isLoading.value = true;
                                    await Login.login(
                                        name: nameController.text,
                                        studentId: studentIdController.text,
                                        context: context);
                                    isLoading.value = false;
                                  }
                                }
                              } else if (isLoading.value) () => null;
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                minimumSize: const Size(double.infinity, 50)),
                            child: Text(isLoading.value ? '登录中...' : '登录',style: TextStyle(color: Theme.of(context).colorScheme.surface,fontSize: 18,letterSpacing: 10),)),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
