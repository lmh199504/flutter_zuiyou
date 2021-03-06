import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zuiyou/pages/homePage/find.dart';
import 'package:flutter_zuiyou/pages/homePage/home.dart';
import 'package:flutter_zuiyou/pages/homePage/message.dart';
import 'package:flutter_zuiyou/pages/homePage/mine.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> tabList = [Home(), Find(), null, Messaage(), Mine()];

  var _pageController = PageController();
  tabBottom(index) {
    if (index != 2) {
      this.setState(() {
        this._currentIndex = index;
        _pageController.jumpToPage(index);
      });
    } else {
      print('发布消息');
    }
  }

  @override
  void initState() {
    super.initState();
    // SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    // );
    // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(0.0),
      ),
      // body: tabList[_currentIndex],
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: tabList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this._currentIndex,
        selectedFontSize: 12,
        onTap: this.tabBottom,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: 25,
              height: 25,
              child: _currentIndex == 0
                  ? Image.asset('lib/images/homeIcon/home_active.png')
                  : Image.asset('lib/images/homeIcon/home.png'),
            ),
            label: '首页',
          ),
          BottomNavigationBarItem(
              icon: Container(
                width: 25,
                height: 25,
                child: _currentIndex == 1
                    ? Image.asset('lib/images/homeIcon/find_active.png')
                    : Image.asset('lib/images/homeIcon/find.png'),
              ),
              label: '发现'),
          BottomNavigationBarItem(
            icon: Container(
              height: 30,
              width: 30,
              // margin: EdgeInsets.only(top: 10),
              // padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Icon(
                Icons.add_circle,
                size: 40,
                color: Color(0xff1695e1),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Container(
                width: 25,
                height: 25,
                child: _currentIndex == 3
                    ? Image.asset('lib/images/homeIcon/message_active.png')
                    : Image.asset('lib/images/homeIcon/message.png'),
              ),
              label: '消息'),
          BottomNavigationBarItem(
              icon: Container(
                width: 25,
                height: 25,
                child: _currentIndex == 4
                    ? Image.asset('lib/images/homeIcon/mine_active.png')
                    : Image.asset('lib/images/homeIcon/mine.png'),
              ),
              label: '我的')
        ],
      ),
    );
  }
}
