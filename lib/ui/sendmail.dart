part of 'uis.dart';
// class Mailer extends StatefulWidget {
//   Mailer({Key key}) : super(key: key);

//   @override
//   _MailerState createState() => _MailerState();
// }

// class _MailerState extends State<Mailer> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Card(
//               child: Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('This is test mail form'),
//                   ),
//                   RaisedButton(
//                     onPressed: () {
//                       sendMail();
//                     },
//                     child: Text('Send'),
//                   )
//                 ],
//               ),
//               elevation: 3,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

sendMail() async {
  String username = 'dulzfaker@gmail.com';
  String password = 'faker12345';
  String domainSmtp = 'smtp.gmail.com';

  //also use for gmail smtp
  //final smtpServer = gmail(username, password);

  //user for your own domain
  final smtpServer =
      SmtpServer(domainSmtp, username: username, password: password, port: 587);

  final message = Message()
    ..from = Address(username, 'BesTeam Company')
    ..recipients.add('dulzfaker@gmail.com')
    //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    //..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject = 'Laporan Setoran Siswa :: 😀 :: ${DateTime.now()}'
    ..text =
        'Assalamualaikum Warahmatullahi Wabarakatuh.\n Anak Ibu/Bapak Tidak Pernah Setoran.\nSilahkan Dateng Ke Sekolah Sekarang!.';
  // ..html = "<h1>Datang Kembali</h1>\n<p>Hey! Follow @ad_dulziz</p>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}
