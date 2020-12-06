part of 'uis.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int pages = 1;
  String name;

  final List_siswa  list = List_siswa();
  final History history = History();
  final Home home = Home();

  String namestring = 'Besteam';

  PageController pageController;

  int currentIndex = 0;
  
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }
  // Rooting

  // String choosePages(int page){
  //   switch(page){
  //     case 0:
  //       name = "Add";
  //       return name;
  //       break;
  //     case 1:
  //       name = "Besteam";
  //       return name;
  //       break;
  //     case 2:
  //       name = "Recent";
  //       return name;
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
              child: currentIndex == 1 ? Text('Students List') : currentIndex == 0 ? Text('Home') : currentIndex == 2 ? Text('History') : null,
            )
          ),
          // actions: <Widget>[
          //   IconButton(icon: Icon(Icons.more_vert), onPressed: null)
          // ],
          elevation: 0,
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Text('Besteam'),
      //         decoration: BoxDecoration(
      //           color: Colors.blueGrey[700],
      //           image: DecorationImage(
      //             image: AssetImage("gambar/haha.jpg"),
      //                fit: BoxFit.cover)
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('Profile'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Tambah Setoran'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Murojaah'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: Text('History'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       )
      //     ]
      //   )
      // ),
      body: PageView(
        controller: pageController,
        children: <Widget>[
          home,
          list,
          history
        ],
        onPageChanged: (int tap) {
          setState(() {
            currentIndex = tap;
          });
        }),
        floatingActionButton: new FloatingActionButton(
        onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder:(context){
                return Create_Siswa();
              }
            ));
          }, 
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),

      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.home,color: Colors.white),
          Icon(Icons.emoji_people_outlined,color: Colors.white),
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
