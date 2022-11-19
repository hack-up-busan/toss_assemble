import 'package:flutter/material.dart';
import 'package:toss_assemble/tabbar.dart';
import 'screens/search_screen.dart';
import 'screens/setting_screen.dart';
import 'screens/calendar_screen.dart';
import 'transaction_list.dart';
import 'screens/today_discovery.dart';
import 'screens/mystock.dart';
import 'appbar_icon.dart';
import 'battom_navigationbar.dart';
import 'popping_card.dart';
//import 'tabs.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
            bodyText2:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        scaffoldBackgroundColor: const Color.fromARGB(141, 0, 0, 0),
        appBarTheme: const AppBarTheme(color: Colors.black),
      ),
      routes: {
        '/search_screen': (context) => SearchScreen('검색창'),
        '/settings': (context) => const SettingScreen(),
        '/calendars': (context) => const CalendarScreen(),
      },
      home: const StockPage(),
    );
  }
}

class StockPage extends StatefulWidget {
  const StockPage({super.key});
  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  final List<Tab> myTabs = [
    const Tab(
      child: const Text('내 주식',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white)),
    ),
    const Tab(
      child: const Text('오늘의 발견',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white)),
    ),
  ];

  List<Transaction> transactions = [
    Transaction(name: '삼성전자', amount: 1, won: '1,740', yield: '+205(13.3)%'),
    Transaction(
        name: '테슬라', amount: 0.011814, won: '3,485', yield: '-899(20.5)%')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          actionsIconTheme: IconThemeData(color: Colors.grey[800]),
          actions: [
            AppBarIcons('/search_screen'),
            AppBarIcons('/calendars'),
            AppBarIcons('/settings'),
          ],
        ),
        body: Column(
          children: [
            FinancialInfo(),
            PoppingCard(),
            const SizedBox(
              height: 7.0,
            ),
            TabBar(
              tabs: myTabs,
              indicatorColor: Colors.white,
              indicatorWeight: 1.5,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0),
              height: 350,
              child: TabBarView(children: [
                MyStocks(),
                todayDiscoverys_test(),
              ]),
            ),
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          child: BottomNavigaitionBars(),
        ),
      ),
    );
  }
}
