part of 'uis.dart';

class List_siswa extends StatefulWidget {
  @override
  _List_siswaState createState() => _List_siswaState();
}

class _List_siswaState extends State<List_siswa> {
  List dataSiswa;

  void dataPost(){
    getSiswa().then((value){
      setState(() {
        dataSiswa = value;
      });
    });
  }
  @override
    void initState() {
    // TODO: implement initState
    super.initState();
    dataPost();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox (
      height: 525,
      child: Column(
        children: <Widget>[
          dataSiswa == null ?  Center(
            child: Align(
              alignment: Alignment.center,
            )
          ): Expanded (
            child: ListView.builder(
//              shrinkWrap: true,
              itemCount: dataSiswa.length,
              itemBuilder: (context, i) {
                return ListTile(
                  subtitle: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder:(context){
                          return Setor(
                            id: dataSiswa[i].id.toString(),
                          );
                        }
                      ));
                    },
                    child: Container(
                      height: 150.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.blueAccent
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: CircleAvatar(radius: 35.0, backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpcA9lzWhcNWPyMEdFfmtJbGRnnOyK_vbnChUFelBQwnh0Reiu&s'),)
                          ),
                          Expanded(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(dataSiswa[i].name, style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                              SizedBox(height: 8.0,),
                              Text(dataSiswa[i].email, style: new TextStyle(fontSize: 12.0, color: Colors.white70),),
                              SizedBox(height: 10.0,),
                              Row(children: <Widget>[
                                Column(children: <Widget>[
                                  Text('2342', style: TextStyle(fontSize: 12.0, color: Colors.white)),
                                  Text('Popularity', style: TextStyle(fontSize: 10.0, color: Colors.white)),
                                ],),
                                Column(children: <Widget>[
                                  Text('2342', style: TextStyle(fontSize: 12.0, color: Colors.white)),
                                  Text('Like', style: TextStyle(fontSize: 10.0, color: Colors.white)),
                                ],),
                                Column(children: <Widget>[
                                  Text('2342', style: TextStyle(fontSize: 12.0, color: Colors.white)),
                                  Text('Followed', style: TextStyle(fontSize: 10.0, color: Colors.white)),
                                ],)
                              ],)
                            ],)),
                          Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(dataSiswa[i].id.toString(), style: new TextStyle(fontSize: 30.0, color: Colors.white70),),
                                  Text('Ranking', style: new TextStyle(fontSize: 14.0, color: Colors.white70),),
                                ],))

                        ],),
                    ),
                  )
                );
              },
            ),
          ),
        ],
      )
    );
  }
  // Widget toggle() {
  //   return FloatingActionButton(
  //     backgroundColor: Colors.blueGrey[600],
  //     onPressed: () {
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => Create_Siswa()));
  //     },
  //     tooltip: 'Toggle',
  //     child: Icon(Icons.add)
  //   );
  // }
}

