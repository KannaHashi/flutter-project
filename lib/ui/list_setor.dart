part of 'uis.dart';

class Setor extends StatefulWidget {
  final String id;

  Setor({this.id});

  @override
  _SetorState createState() => _SetorState();
}

class _SetorState extends State<Setor> {
  List<dynamic> oneSiswa;

  void dataOneSiwa(){
    getOneSiswa(widget.id).then((value) {
      setState(() {
        oneSiswa = value;
      });
    });
  }

  @override
  void initState(){
    super.initState();
    dataOneSiwa();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1f6f8b),
        title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.center,
              child: Text('Detail Siswa',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            )
        ),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          oneSiswa == null ?  Center(
              child: Align(
                alignment: Alignment.center,
              )
          ): Expanded (
            child: ListView.builder(
              itemCount: oneSiswa.length,
              itemBuilder: (context, i){
                return  Container(
                  child: Column(
                    children: <Widget>[
                      Card(
                        elevation: 8,
                        margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: ListTile(
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          title: Text(
                            oneSiswa[i]['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,                            
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,                                
                                children: <Widget>[
                                  Text("alamat            : " + oneSiswa[i]['alamat'].toString() + "\nTanggal lahir : " + oneSiswa[i]['tanggal_lahir'].toString() + "\nemail              :" + oneSiswa[i]['email'].toString() + "\nno telepon     : " + oneSiswa[i]['no_telp'].toString()),  
                                  // Text("TTl : " + oneSiswa[i]['tanggal_lahir'].toString()),                                   
                                  // Text("email : " + oneSiswa[i]['email'].toString()),                                   
                                  // Text("no telepon : " + oneSiswa[i]['no_telp'].toString()),                                   
                                ],
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                );
              }
            )
          ),
        ],
      ),
    );
  }
}