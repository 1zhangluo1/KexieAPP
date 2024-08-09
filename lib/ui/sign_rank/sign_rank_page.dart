
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:kexie_app/models/topFiveUsers/topFiveUsers.dart';
import 'package:kexie_app/ui/sign_rank/sign_rank_controller.dart';
import 'package:kexie_app/widgets/error_page.dart';
import 'package:kexie_app/widgets/keep_alive_wrapper.dart';

class SignRankPage extends StatefulWidget {
  const SignRankPage({super.key});

  @override
  State<SignRankPage> createState() => _SignRankPageState();
}

class _SignRankPageState extends State<SignRankPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final c = Get.put(SignRankController());

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('打卡排名统计'),
        bottom: TabBar(
          tabs: c.tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
          controller: tabController,
          onTap: (index) => c.pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: PageView(
            controller: c.pageController,
            onPageChanged: (index) {
              tabController.animateTo(index);
            },
            children: [
              FutureBuilder(
                  future: c.getNewTopFive(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return snapshot.hasError
                          ? ErrorPage.loadDataFailed
                          : KeepAliveWrapper(child: newRank());
                    } else {
                      return Center(
                          child: SpinKitWave(
                        color: Theme.of(context).colorScheme.primary,
                      ));
                    }
                  }),
              KeepAliveWrapper(child: oldRank()),
            ],
          ),
        ),
      ),
    );
  }

  Widget newRank() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('签到时长排名',style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold,fontSize: 25),),
          const SizedBox(height: 5,),
          Obx(() => Text('第${c.week.value}周',style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 18))),
          const SizedBox(height: 20,),
          Obx(
            () => Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: AspectRatio(aspectRatio: 1 ,child: barChart(c.topFiveUsers)),
              ),
            ),
          ),
          const SizedBox(height: 25,),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: 600,
                  child: ListView.separated(
                    itemCount: c.usersCount.value + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 120,
                                child: Center(child: Text('学号', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),
                              ),
                              SizedBox(
                                width: 90,
                                child: Center(child: Text('姓名', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),
                              ),
                              SizedBox(
                                width: 90,
                                child: Center(child: Text('部门', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),
                              ),
                              SizedBox(
                                width: 90,
                                child: Center(child: Text('地点', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),
                              ),
                              SizedBox(
                                width: 90,
                                child: Center(child: Text('总时长', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),
                              ),
                              SizedBox(
                                width: 90,
                                child: Center(child: Text('排名', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return rankRow(c.topFiveUsers[index - 1]);
                      }
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget oldRank() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 600,
              child: ListView.separated(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(width: 100, child: Text((index * 2).toString())),
                      SizedBox(width: 100, child: Text((index * 2).toString())),
                      SizedBox(width: 100, child: Text((index * 2).toString())),
                      SizedBox(width: 100, child: Text((index * 2).toString())),
                      SizedBox(width: 100, child: Text((index * 2).toString())),
                      SizedBox(width: 100, child: Text((index * 2).toString())),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget rankRow(Data rankUser) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Center(
              child: Text(
                rankUser.userId.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            width: 90,
            child: Center(child: Text(rankUser.userName, style: const TextStyle(fontSize: 16))),
          ),
          SizedBox(
            width: 90,
            child: Center(child: Text(rankUser.userDept, style: const TextStyle(fontSize: 16))),
          ),
          SizedBox(
            width: 90,
            child: Center(
              child: Text(rankUser.userLocation,
                  style: const TextStyle(fontSize: 16)),
            ),
          ),
          SizedBox(
            width: 90,
            child: Center(child: Text(rankUser.totalTime, style: const TextStyle(fontSize: 16))),
          ),
          SizedBox(
            width: 90,
            child: Center(
              child: Text((rankUser.order ?? 0).toString(),
                  style: const TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  BarChart barChart(List<Data> topFiveData) {
    return BarChart(
      BarChartData(
        maxY: c.findMax(double.parse(c.topFiveUsers.first.totalTime)),
        borderData: FlBorderData(
            show: true,
            border: const Border(top: BorderSide.none,right: BorderSide.none,left: BorderSide(color: Colors.lightBlue),bottom: BorderSide(color: Colors.lightBlue)
            )
        ),
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          drawVerticalLine: false,
          horizontalInterval: c.findMax(double.parse(c.topFiveUsers.first.totalTime)) / 6,
          getDrawingHorizontalLine: (v) => FlLine(
            color: Colors.grey.withOpacity(0.3),
            strokeWidth: 1,
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value,meta) {
              return SideTitleWidget(
                  space: 5,
                  axisSide: meta.axisSide,
                  child: Text(c.topFiveUsers[value.toInt()].userName,style:const TextStyle(
                    fontSize: 14,
                    color: Colors.lightBlue
                  ) ,),
              );
            },
          )),
        ),
        barGroups: List.generate(c.usersCount.value, (i) {
          return BarChartGroupData(
            x: i,
            barRods: [
            BarChartRodData(
              toY: double.parse(c.topFiveUsers[i].totalTime),
              color: c.colorOptions[i],
              width: c.usersCount.value == 1 ? (MediaQuery.of(context).size.width - 200) / 2 : (MediaQuery.of(context).size.width - 200) / c.usersCount.value,
              borderRadius: BorderRadius.zero
            ),
          ],
            showingTooltipIndicators: [0],
          );
        }),
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (group) => Colors.transparent,
            tooltipPadding: EdgeInsets.zero,
            tooltipMargin: 8,
            getTooltipItem: (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
                ) {
              return BarTooltipItem(
                rod.toY.toString(),
                TextStyle(
                  color: rod.color,
                ),
              );
            },
          ),
        )
      ),
      swapAnimationDuration: const Duration(milliseconds: 300),
      swapAnimationCurve: Curves.linear,
    );
  }

}
