import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:kexie_app/global/global.dart';
import 'package:kexie_app/routes/route.dart';
import 'package:kexie_app/ui/sign_record/sign_record_controller.dart';
import 'package:kexie_app/widgets/error_page.dart';
import '../../models/signRecords/signRecords.dart';

class SignRecordPage extends StatefulWidget {
  const SignRecordPage({super.key});

  @override
  State<SignRecordPage> createState() => _SignRecordPageState();
}

class _SignRecordPageState extends State<SignRecordPage> {
  final c = Get.put(SignRecordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => c.toTop(),shape: const CircleBorder(),child: const Icon(Icons.arrow_upward),),
      appBar: AppBar(
        title: Text(
          '打卡记录统计',
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
        child: SafeArea(
            child: Global.isLogin.value
                ? FutureBuilder(
                    future: c.initRecordData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return ErrorPage.loadDataFailed;
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '截至今日，宁的所有的签到记录',
                                style: TextStyle(fontSize: 21),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                '为了简约，时长低于0.05不展示',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Obx(
                                () => DropdownButton<String>(
                                  hint: Text(c.terms.first),
                                  value: c.selectedTerm.value,
                                  onChanged: (String? newValue) async {
                                    c.selectedTerm.value == newValue
                                        ? null
                                        : await c.getRecords(term: newValue);
                                    c.selectedTerm.value = newValue!;
                                  },
                                  items: c.terms.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: SizedBox(
                                      width: 1030,
                                      child: Obx(
                                        () => ListView.separated(
                                          controller: c.scrollController,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index) {
                                            return index == 0
                                                ? const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10.0),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 130,
                                                          child: Text('学号',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        SizedBox(
                                                          width: 100,
                                                          child: Text('姓名',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        SizedBox(
                                                          width: 100,
                                                          child: Text('部门',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        SizedBox(
                                                          width: 100,
                                                          child: Text('地点',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        SizedBox(
                                                          width: 190,
                                                          child: Text('开始时间',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        SizedBox(
                                                          width: 190,
                                                          child: Text('结束时间',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        SizedBox(
                                                          width: 100,
                                                          child: Text('累计',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        SizedBox(
                                                          width: 100,
                                                          child: Text('状态',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : (index == c.records.length
                                                    ? const Padding(
                                                      padding: EdgeInsets.symmetric(vertical: 15.0),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width:343,
                                                            child: Center(
                                                              child: Text(
                                                                'END',
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:343,
                                                            child: Center(
                                                              child: Text(
                                                                'END',
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:343,
                                                            child: Center(
                                                              child: Text(
                                                                'END',
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                    : recordRow(c.records[index]));
                                          },
                                          separatorBuilder: (context, index) {
                                            return Container(
                                              width: 1020,
                                              height: 1,
                                              color: Colors.grey,
                                            );
                                          },
                                          itemCount: c.records.length + 1,
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          );
                        }
                      } else {
                        return Center(
                            child: SpinKitWave(
                          color: Theme.of(context).colorScheme.primary,
                        ));
                      }
                    },
                  )
                : Center(
                    child: Text.rich(TextSpan(children: [
                      const TextSpan(
                          text: '此功能登录后方可使用，', style: TextStyle(fontSize: 20)),
                      TextSpan(
                          text: '请先登录',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(AppRoute.loginPage)),
                    ])),
                  )),
      ),
    );
  }

  Widget recordRow(Data record) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(
              record.userId.toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(record.userName, style: const TextStyle(fontSize: 16)),
          ),
          SizedBox(
            width: 100,
            child: Text(record.userDept, style: const TextStyle(fontSize: 16)),
          ),
          SizedBox(
            width: 100,
            child:
                Text(record.userLocation, style: const TextStyle(fontSize: 16)),
          ),
          SizedBox(
            width: 190,
            child: Text(record.start, style: const TextStyle(fontSize: 16)),
          ),
          SizedBox(
            width: 190,
            child: Text(record.end, style: const TextStyle(fontSize: 16)),
          ),
          SizedBox(
            width: 100,
            child: Text(c.calculateTotalTime(record.start, record.end,record.status) == 100 ? '' : c.calculateTotalTime(record.start, record.end,record.status).toString(),
                style: const TextStyle(fontSize: 16)),
          ),
          SizedBox(
            width: 100,
            child: Text(record.status, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
