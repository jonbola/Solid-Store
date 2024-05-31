import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

const primayColor = Color(0xff56ef02);

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: 100.0,
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                      height: 150.0,
                      width: 150.0,
                      child: IconButton(
                        onPressed: null,
                        icon: Image.asset('resources/images/img_logo.png'),
                      )),
                  const Text(
                    'Solid Electronic',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              const SizedBox(
                width: 200.0,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm',
                  ),
                ),
              ),
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: IconButton(
                  onPressed: null,
                  icon: Image.asset('resources/icons/ic_shopping_cart.png'),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: IconButton(
        onPressed: null,
        icon: Image.asset(
          'resources/icons/ic_arrow_up.png',
          width: 50.0,
          height: 50.0,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            tabs: [
              Tab(
                child: IconButton(
                  onPressed: null,
                  icon: Image.asset('resources/icons/ic_home.png'),
                ),
              ),
              Tab(
                child: IconButton(
                  onPressed: null,
                  icon: Image.asset('resources/icons/ic_shopping.png'),
                ),
              ),
              Tab(
                child: IconButton(
                  onPressed: null,
                  icon: Image.asset('resources/icons/ic_account.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
