import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({Key? key}) : super(key: key);

  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectItemIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Name"),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.dashboard, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: Text("分享拉运线路"),
                    );
                  });
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home_outlined, color: Colors.grey),
                  Text("任务"),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home_outlined, color: Colors.grey),
                  Text("运单"),
                ],
              ),
            ),
            const SizedBox(),
            InkWell(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home_outlined, color: Colors.grey),
                  Text("消息"),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home_outlined, color: Colors.grey),
                  Text("我的"),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.camera_alt),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.business), label: "Business"),
      //     BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
      //   ],
      //   currentIndex: _selectItemIndex,
      //   fixedColor: Colors.blue,
      //   onTap: (index) {
      //     setState(() {
      //       _selectItemIndex = index;
      //     });
      //   },
      // ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset("assets/images/avatar.png", width: 80),
                    ),
                  ),
                  Text("司机张三", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: Scrollbar(
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("我的信息"),
                    ),
                    ListTile(
                      leading: Icon(Icons.add_circle_outline),
                      title: Text("添加车辆"),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("软件设置"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
