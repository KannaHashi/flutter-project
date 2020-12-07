part of 'uis.dart';

class CreateHafalan extends StatefulWidget {
  @override
  _CreateHafalanState createState() => _CreateHafalanState();
}
  // String name = 'Create New Store Note';

class _CreateHafalanState extends State<CreateHafalan> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _siswaId = TextEditingController();
  TextEditingController _suratAwal = TextEditingController();
  TextEditingController _ayatAwal = TextEditingController();
  TextEditingController _suratAkhir = TextEditingController();
  TextEditingController _ayatAkhir = TextEditingController();
  TextEditingController _keterangan = TextEditingController();
  String msg;

  void simpanData() {
    createHafalan(_siswaId.text, _suratAwal.text, _ayatAwal.text,
            _suratAkhir.text, _ayatAkhir.text, _keterangan.text)
        .then((value) {
      if (value == true) {
        AlertDialog alertdialog = AlertDialog(
          content: Container(
            height: 100,
            child: Column(
              children: <Widget>[
                Text("Hafalan Berhasil Ditambahkan"),
                RaisedButton(
                  child: Text("OK"),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
        showDialog(context: context, child: alertdialog);
      } else {
        AlertDialog alertdialog = AlertDialog(
          content: Container(
            height: 100,
            child: Column(
              children: <Widget>[
                Text("Hafalan Gagal Ditambahkan"),
                RaisedButton(
                    child: Text("OK"), onPressed: () => Navigator.pop(context))
              ],
            ),
          ),
        );
        showDialog(context: context, child: alertdialog);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    return Scaffold(
      body:  ListView(

    children: [Container(
      child: Column(
        children: [
            TopContainer(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              width: width,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hafalan Baru',
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
                      MyTextField(label: 'ID Siswa'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: MyTextField(
                            controller: _suratAwal,
                            label: 'Surat Awal',
                            icon: downwardIcon,
                          )),
                          SizedBox(width: 40),
                          Expanded(
                            child: MyTextField(
                              controller: _suratAkhir,
                              label: 'Surat Akhir',
                              icon: downwardIcon,
                            ),
                          ),
                        ],
                      ),
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: MyTextField(
                        controller: _ayatAwal,
                        label: 'Ayat Awal',
                        icon: downwardIcon,
                      )),
                      SizedBox(width: 40),
                      Expanded(
                        child: MyTextField(
                          controller: _ayatAkhir,
                          label: 'Ayat Akhir',
                          icon: downwardIcon,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  MyTextField(
                    controller: _keterangan,
                    label: 'Keterangan',
                    minLines: 1,
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
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                    width: width - 40,
                    decoration: BoxDecoration(
                      color: LightColors.kBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: GestureDetector(
                      child:
                    Text(
                      'Upload Hafalan',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    onTap: () => simpanData(),  
                    ),
                  ),
                ],
              ),
            ),
        ]
      ),
    )]
    ),
    );
  }
}