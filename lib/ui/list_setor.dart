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
    return Column(
        children: <Widget>[
          oneSiswa == null ?  Center(
              child: Align(
                alignment: Alignment.center,
              )
          ): Expanded (
            child: Container(
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
                        oneSiswa[0]['name'].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.arrow_right,
                                color: Colors.greenAccent,
                              ),
                              Expanded(
                                  child: Text("Absen Hadir : " +
                                      oneSiswa[0]
                                      ['name']
                                          .toString())),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.arrow_right,
                                color: Colors.greenAccent,
                              ),
                              Text('Absen Pulang : ' +
                                  oneSiswa[0]['name'].toString()),
                            ],
                          ),
                        ],
                      ),
                      trailing: Column(
                        children: <Widget>[
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                          Text("Tepat Waktu")
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  }
}
