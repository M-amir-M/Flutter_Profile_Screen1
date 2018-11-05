import 'package:flutter/material.dart';

void main() => runApp(new App());

class App extends StatefulWidget {
  @override
  AppState createState() => new AppState();
}

class AppState extends State<App> with SingleTickerProviderStateMixin {
  final ThemeData androidTheme = new ThemeData(
      fontFamily: 'is',
      accentColor: Colors.black45,
      primaryColor: Colors.white);
  final redColor = Color(0xffED4C67);
  final greyColor = Color(0xff95a5a6);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _currentTabIndex = 0;
  List<Widget> _children;
  final _slides = [
    {
      "id": 1,
      "img":
          'https://www.rd.com/wp-content/uploads/2016/12/07-Parenting-Hacks-for-Playing-with-Your-Kids_busy_625505072_SolStock.jpg',
      "title": 'خمیر بازی',
    },
    {
      "id": 1,
      "img": "http://enabledkids.ca/wp-content/uploads/aaa1.jpg",
      "title": 'نقاشی',
    },
    {
      "id": 1,
      "img":
          'http://babygourmet.com/sites/default/files/field/image/2.2.15_too_much_food.jpg',
      "title": 'غذا خوردن',
    },
    {
      "id": 1,
      "img":
          'http://www.actualtextiles.com/wp-content/gallery/kids/tutto-piccolo-kids-clothes.jpg',
      "title": 'لباس پوشیدن',
    },
  ];
  @override
  void initState() {
    _children = [
      Container(
        child: Center(
          child: Text('Tab1'),
        ),
      ),
      Container(
        child: Center(
          child: Text('Tab2'),
        ),
      ),
      _profileTab(),
      Container(
        child: Center(
          child: Text('Tab3'),
        ),
      ),
      Container(
        child: Center(
          child: Text('Tab4'),
        ),
      ),
    ];
    super.initState();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentTabIndex = index;
    });
    print(index);
  }
  void _showDialog(value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      
        content: new Text(value,textAlign: TextAlign.right, style: TextStyle(fontFamily: 'is'),)
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new MaterialApp(
            theme: androidTheme,
            title: '',
            home: new Scaffold(
              key: _scaffoldKey,
              appBar: new AppBar(
                elevation: 0.0,
                title: new Center(
                    child: Container(
                  padding: EdgeInsets.only(left: 50.0),
                  child: new Text(
                    'نازنین زهرا',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                )),
                leading: new Container(
                  child: IconButton(
                    iconSize: 22.0,
                    icon: Icon(
                      Icons.child_care,
                      color: Colors.black54,
                    ),
                    onPressed: () {},
                  ),
                ),
                actions: <Widget>[
                  Stack(
                    children: <Widget>[
                      IconButton(
                        iconSize: 22.0,
                        icon: new Icon(
                          Icons.notifications,
                          color: Colors.black54,
                        ),
                        onPressed: () {},
                      ),
                      Positioned(
                        right: 15.0,
                        top: 12.0,
                        child: Container(
                          width: 7.0,
                          height: 7.0,
                          decoration: BoxDecoration(
                              color: redColor,
                              borderRadius: BorderRadius.circular(100.0),
                              border:
                                  Border.all(width: 1.0, color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    iconSize: 22.0,
                    icon: new Icon(
                      Icons.settings,
                      color: Colors.black54,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              body: new Container(
                  child: Column(
                children: <Widget>[
                  Expanded(flex: 6, child: _children[_currentTabIndex]),
                  buildTabbar()
                ],
              )),
            )));
  }

  Widget _profileTab() {
    return Container(
      child: Stack(
        children: <Widget>[
          //background
          Container(
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 3,
                    child: Container(
                        color: Colors.white,
                        child: ClipPath(
                          clipper: BackClipper(),
                          child: Container(
                            color: redColor,
                          ),
                        ))),
                Expanded(flex: 2, child: Container())
              ],
            ),
          ),
          //forground
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Center(
                    child: Container(
                      height: 70.0,
                      width: 70.0,
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.0)),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/d9/ab/a1/d9aba10b7b40dfb4e8e131514b262957.jpg'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border:
                                Border.all(width: 1.0, color: Colors.white)),
                        child: IconButton(
                          icon: Icon(
                            Icons.priority_high,
                            color: Colors.white,
                          ),
                          onPressed: () {_showDialog('اطلاعات...');},
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'نازنین زهرا محمدی',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(
                              height: 1.0,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  color: Colors.black12),
                              child: Text(
                                'یک و نیم ساله',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'is_l',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border:
                                Border.all(width: 1.0, color: Colors.white)),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {_showDialog('ویرایش...');},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'امتیازات',
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.white),
                            ),
                            Text(
                              '6',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white.withOpacity(0.5),
                        width: 1.0,
                        height: 40.0,
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'علاقه ها',
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.white),
                            ),
                            Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 4.0,
                  shrinkWrap: true,
                  childAspectRatio: 2.0,
                  children: <Widget>[
                    _buildCard('وزن', '15.5 kg', Icons.alarm_add, 1),
                    _buildCard('قد', '70.2 cm', Icons.arrow_upward, 2),
                  ],
                ),
                SizedBox(
                  height: 1.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 60.0,
                        height: 25.0,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100.0),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 1.0,
                                  blurRadius: 5.0,
                                  color: Colors.grey[400])
                            ]),
                        child: FlatButton(
                          padding: EdgeInsets.all(0.0),
                          child: Text('افزودن'),
                          onPressed: () {_showDialog('افزودن...');},
                        ),
                      ),
                      Text('اتفاقات اخیر'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                    height: 125.0,
                    child: ListView.builder(
                      itemCount: _slides.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.only(
                              left: index == 0 ? 15.0 : 0.0,
                              right: index == _slides.length - 1 ? 15.0 : 0.0),
                          child: _buildSlide(_slides[index]),
                        );
                      },
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard(String title, String value, icon, int cardIndex) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1.0, blurRadius: 5.0, color: Colors.grey[400])
            ]),
        child: Column(
          children: <Widget>[
            SizedBox(height: 5.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                  Icon(icon)
                ],
              ),
            ),
            Expanded(
                child: Container(
                    width: 175.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    child: Center(
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 20.0, color: redColor),
                      ),
                    )))
          ],
        ),
        margin: cardIndex.isEven
            ? EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)
            : EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0));
  }

  Widget _buildSlide(data) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1.0, blurRadius: 5.0, color: Colors.grey[400])
          ]),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius:
                  new BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image(
                width: 150.0,
                fit: BoxFit.cover,
                image: NetworkImage(data['img']),
              ),
            ),
          ),
          Expanded(
              child: Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                  ),
                  child: Center(
                    child: Text(
                      data['title'],
                      style: TextStyle(fontSize: 14.0),
                    ),
                  )))
        ],
      ),
    );
  }

  buildTabbar() {
    return Expanded(
        child: new Stack(
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey[350],
                      blurRadius: 10.0,
                      spreadRadius: 1.0)
                ]),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 5.0),
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[350],
                            blurRadius: 10.0,
                            spreadRadius: 1.0)
                      ]),
                ),
              )
            ],
          ),
        ),
        Container(
            child: ClipPath(
                clipper: new TabbarClipper(),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      buildTabbarItem(Icons.toys, 'اتاق بازی', 0),
                      buildTabbarItem(Icons.trending_up, 'پیشرفت', 1),
                      buildCenterTabbarItem(Icons.home, 'پروفایل', 2),
                      buildTabbarItem(Icons.library_books, 'کتابخانه', 3),
                      buildTabbarItem(Icons.directions_car, 'سفر', 4),
                    ],
                  ),
                )))
      ],
    ));
  }

  Widget buildTabbarItem(icon, String title, int index) {
    bool isActive = _currentTabIndex == index;
    var color = isActive ? redColor : greyColor;
    return Expanded(
        child: InkWell(
      onTap: () {
        this.onTabTapped(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: color,
          ),
          Text(
            title,
            style: TextStyle(color: color),
          )
        ],
      ),
    ));
  }

  Widget buildCenterTabbarItem(icon, String title, int index) {
    bool isActive = _currentTabIndex == index;
    var color = isActive ? redColor : greyColor;
    return Expanded(
        child: InkWell(
            highlightColor: Colors.red,
            onTap: () {
              this.onTabTapped(index);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 50.0,
                  width: 50.0,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1.0,
                          color: isActive ? Colors.red : Colors.transparent),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/originals/d9/ab/a1/d9aba10b7b40dfb4e8e131514b262957.jpg'),
                  ),
                ),
              ],
            )));
  }
}

class TabbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 25.0);
    path.lineTo(size.width - 3 * (size.width / 7), 25.0);

    var firstControlPoint = new Offset(size.width / 2, 0.0);
    var firstEndPoint = new Offset(3 * (size.width / 7), 25.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(0.0, 25.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BackClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0.0, size.height - size.height / 5);

    var firstControlPoint = new Offset(size.width / 2, size.height + 25);
    var firstEndPoint = new Offset(size.width, size.height - size.height / 5);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, 0.0);

    var secondControlPoint = new Offset(size.width / 2, size.height / 5 + 25);
    var secondEndPoint = new Offset(0.0, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
