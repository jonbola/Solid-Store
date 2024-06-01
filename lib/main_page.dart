import 'package:eletronic_conponents_store/account_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

bool searchStatus = true;

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        title: Row(
          children: <Widget>[
            SizedBox(
              height: 100.0,
              width: 100.0,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ),
                  );
                },
                icon: Image.asset('resources/images/img_logo.png'),
              ),
            ),
            const Text(
              'Solid Electronic',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
        actions: <Widget>[
          SizedBox(
            width: 50.0,
            height: 50.0,
            child: IconButton(
              onPressed: SetSearchStatus,
              icon: Image.asset('resources/icons/ic_search.png'),
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
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: SizedBox(
            width: 300.0,
            height: 50.0,
            child: Visibility(
              visible: ,
              child: TextField(
                decoration: InputDecoration(hintText: 'Tìm kiếm'),
              ),
            ),
          ),
        ),
      ),
      body: const CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccountPage(),
                      ),
                    );
                  },
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

void SetSearchStatus() {
  if (!searchStatus) {
    searchStatus == true;
  } else {
    searchStatus == false;
  }
}

void SetFragmentPage() {}
