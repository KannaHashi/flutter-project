part of 'uis.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String name = 'Besteam';

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

  @override
  Widget build(BuildContext context) {
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
                            subheading('Data'),
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
}
