part of 'uis.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController _pageController;

  int pages = 1;
  String name;

  final Add  add = Add();
  final History history = History();
  final Home home = Home();

  Widget showPages = Home();

  // Rooting

  Widget choosePages(int page){
    switch(page){
      case 0:
        name = "Add";
        return add;
        break;
      case 1:
        name = "Besteam";
        return home;
        break;
      case 2:
        name = "Recent";
        return history;
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff1f6f8b),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                name??'Besteam',
                style: TextStyle(color: Colors.white, fontFamily: "Bahnschrift"),
              ),
            )
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.more_vert), onPressed: null)
          ],
          elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Besteam'),
              decoration: BoxDecoration(
                color: Colors.blueGrey[700],
                image: DecorationImage(
                  image: AssetImage("gambar/haha.jpg"),
                     fit: BoxFit.cover)
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Tambah Setoran'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Murojaah'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('History'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ]
        )
      ),
      body: ListView(
        children: <Widget>[
          PageView.custom(
            childrenDelegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  Widget pages;
        
                  if (showPages == "1") {
                    pages = _buildHome(context);
                  } else if (showPages == "0") {
                    pages = _buildAdd(context);
                  }
        
                  return pages;
                },
                childCount: 2,
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.emoji_people_outlined,color: Colors.white),
          Icon(Icons.home,color: Colors.white),
          Icon(Icons.history,color: Colors.white),
        ],
        color: Colors.blueAccent,
        height: 50,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        index: pages,
        onTap: (int tap){
          setState(() {
            showPages = choosePages(tap);
          });
        },
      ),
    );
  }
}

Widget _buildAdd(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    return Container(
      child: Column(
        children: [
            TopContainer(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              width: width,
              child: Column(
                children: <Widget>[
                  MyBackButton(),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Create new task',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyTextField(label: 'Title'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: MyTextField(
                              label: 'Date',
                              icon: downwardIcon,
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
            Container(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: MyTextField(
                        label: 'Start Time',
                        icon: downwardIcon,
                      )),
                      SizedBox(width: 40),
                      Expanded(
                        child: MyTextField(
                          label: 'End Time',
                          icon: downwardIcon,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  MyTextField(
                    label: 'Description',
                    minLines: 3,
                    maxLines: 3,
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  )
                ],
              ),
            )),
            Container(
              height: 80,
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Create Task',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                    width: width - 40,
                    decoration: BoxDecoration(
                      color: LightColors.kBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
              ),
            ),
        ]
      ),
    );
}

Widget _buildHome(BuildContext context){
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: LightColors.kDarkYellow,
                  ),
                  child: TopContainer(
                  height: 150,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CircularPercentIndicator(
                                radius: 90.0,
                                lineWidth: 5.0,
                                animation: true,
                                percent: 0.65,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: LightColors.kDarkBlus,
                                backgroundColor: LightColors.kBiruNavbar,
                                center: CircleAvatar(
                                  backgroundColor: LightColors.kLightYellow,
                                  radius: 35.0,
                                  backgroundImage: AssetImage(
                                    'gambar/haha.jpg',
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'Nanoka',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        color: LightColors.kLightyBlue,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'kannayama116@gmail.com',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                ),
                ),
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: LightColors.kDarkYellow,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60.0),
                      bottomLeft: Radius.circular(60.0),
                    ),
                    boxShadow: [
                      BoxShadow(  
                        color: LightColors.kDarkYellow.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(

                  ),
                ),
                Container(
                  child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                subheading('Recent Setoran'),
                                RaisedButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                                })
                              ],
                            ),
                            SizedBox(height: 15.0),
                            TaskColumn(
                              icon: Icons.alarm,
                              iconBackgroundColor: LightColors.kRed,
                              title: 'Nanokaaa',
                              subtitle: 'An-Najm, ayat 17 - 59',
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TaskColumn(
                              icon: Icons.blur_circular,
                              iconBackgroundColor: LightColors.kDarkYellow,
                              title: 'Hanif Lathan',
                              subtitle: 'At-Thur, ayat 1 - 25',
                            ),
                            SizedBox(height: 15.0),
                            TaskColumn(
                              icon: Icons.check_circle_outline,
                              iconBackgroundColor: LightColors.kBlue,
                              title: 'Dulziz',
                              subtitle: 'Al-Fatihah : 1 - Al-Falak : 2',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            subheading('Active Projects'),
                            SizedBox(height: 5.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ), 
              ],
            ),
          ),
        ],
      ),
    );
}