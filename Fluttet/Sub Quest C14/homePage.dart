import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'drawerPage.dart';
import 'imageSlider.dart';
import 'carouselSlider.dart';

class IconDatas {
  final IconData icon;
  final String description;

  IconDatas(this.icon, this.description);
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageList = [
    'images/yes/banner1.png',
    'images/yes/banner2.png',
    'images/yes/banner3.png',
  ];

  final List<String> bookImage = [
    'images/yes/book1.png',
    'images/yes/book2.png',
    'images/yes/book3.png',
    'images/yes/book4.png',
    'images/yes/book5.png',
  ];

  final List<IconDatas> iconList = [
    IconDatas(Icons.calendar_month, '출석체크'),
    IconDatas(FontAwesomeIcons.gift, '사은품'),
    IconDatas(FontAwesomeIcons.ticket, '혜택모음'),
    IconDatas(FontAwesomeIcons.bookAtlas, '리:센스'),
    IconDatas(FontAwesomeIcons.message, '사락'),
    IconDatas(FontAwesomeIcons.shop, '매장안내'),
    IconDatas(FontAwesomeIcons.star, '단독판매'),
    IconDatas(FontAwesomeIcons.donate, '예스펀딩'),
    IconDatas(FontAwesomeIcons.earlybirds, '얼리리더'),
    IconDatas(FontAwesomeIcons.infinity, '크레마클럽'),
  ];

  List<Map<String, Object>>? _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': HomePage()},
      {'page': DrawerPage()},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: Image.asset(
            'images/yes/yes24.png',
            width: 80,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0), // 전 방향 사이드와 간격 차이
              child: TextField(
                decoration: InputDecoration(
                  hintText: "무엇이든 검색하세요",
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: Icon(Icons.search), // 검색 아이콘 오른쪽에 추가
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 12, vertical: 10), // 검색창 크기 설정
                  border: InputBorder.none, // 검색 창 경계 구분
                  filled: true,
                  fillColor: Colors.grey[300],
                ),
              ),
            ),
            ImageSlider(imageList: imageList),
            /*GridView.count(
              crossAxisCount: 6,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.0,
              padding: EdgeInsets.all(16.0),
              children: List.generate(
                iconList.length,
                (index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(iconList[index].icon),
                    Text(iconList[index].description),
                  ],
                ),
              ),
            ),*/ // 간격오류 때문에 GridView에서 Warp 위젯으로 변경
            SizedBox(height: 20),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              spacing: 37,
              runSpacing: 10,
              children: List.generate(
                iconList.length,
                (index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(iconList[index].icon),
                    Text(iconList[index].description),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            CarouselWidget(bookImage: bookImage),
          ],
        ),
      ), /*
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '메뉴',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'MY',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
          ),
        ],
        currentIndex: _selectedIndex,
      ),*/
    );
  }
}
