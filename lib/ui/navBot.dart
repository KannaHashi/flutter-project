part of 'uis.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int pages = 1;
  String name;

  final Add  add = Add();
  final History history = History();
  final Home home = Home();

  Widget showPages = Home();

  PageController pageController;

  int currentIndex = 0;
  
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }
  // Rooting

  // Widget choosePages(int page){
  //   switch(page){
  //     case 0:
  //       name = "Add";
  //       return add;
  //       break;
  //     case 1:
  //       name = "Besteam";
  //       return home;
  //       break;
  //     case 2:
  //       name = "Recent";
  //       return history;
  //       break;
  //   }
  // }
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
      body: PageView(
        controller: pageController,
        children: <Widget>[
          add,
          home,
          history
        ],
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        }),
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
        index: currentIndex,
        onTap: (int tap){
          pageController.animateToPage(tap, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          setState(() {
            currentIndex = tap;
          });
        },
      ),
    );
  }
}
