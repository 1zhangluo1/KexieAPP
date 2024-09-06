import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kexie_app/ui/tools/electricity_query/electricity_query_controller.dart';

class ElectricityQueryPage extends StatefulWidget {
  const ElectricityQueryPage({super.key});

  @override
  State<ElectricityQueryPage> createState() => _ElectricityQueryPageState();
}

class _ElectricityQueryPageState extends State<ElectricityQueryPage> {
  final c = Get.put(ElectricityQueryController());
  final dateFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电费查询'),
      ),
      body: GestureDetector(
        onTap: () => c.focus.hasFocus ? c.focus.unfocus() : null,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        focusNode: c.focus,
                        controller: c.inputController,
                        decoration: InputDecoration(
                            hintText: '输入y加楼栋号加房间号查询,如:y10201',
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (c.inputController.text.isNotEmpty && !c.querying.value) {
                            c.getElectricityData(c.inputController.text.trim());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6))),
                        child: Text('查询')),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '查询结果',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 26,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() {
                  if (c.isQuery.value) {
                    if (!c.querying.value) {
                      return Table(
                        border: TableBorder.all(
                            borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).colorScheme.onSurface
                        ),
                        columnWidths: {
                          0: FlexColumnWidth(),
                          1: FlexColumnWidth()
                        },
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    '日期',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text('剩余电量',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ),
                              ),
                            ],
                          ),
                          ...List.generate(c.electricityData.length, (index) {
                            return TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    dateFormat.format(DateTime.parse(
                                        c.electricityData[index].date)),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    c.electricityData[index].electricity,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ],
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(top: 150.0),
                        child: SpinKitWave(
                          color: Theme.of(context).colorScheme.primary,
                          size: 50,
                        ),
                      );
                    }
                  } else {
                    return SizedBox();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
