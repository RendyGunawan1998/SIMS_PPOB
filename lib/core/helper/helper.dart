import '../../core.dart';
import 'package:intl/intl.dart';

final oCcy = NumberFormat("#,##0.00", "en_US");

textInter(String title, Color color, FontWeight fw, double fs) {
  return Text(title,
      style: GoogleFonts.inter(color: color, fontWeight: fw, fontSize: fs));
}

colorRed() {
  return HexColor('#EC2B18');
}

textInterAlignCenter(String title, Color color, FontWeight fw, double fs) {
  return Text(title,
      textAlign: TextAlign.center,
      style: GoogleFonts.inter(color: color, fontWeight: fw, fontSize: fs));
}

textInterAlignRight(String title, Color color, FontWeight fw, double fs) {
  return Text(title,
      textAlign: TextAlign.right,
      style: GoogleFonts.inter(color: color, fontWeight: fw, fontSize: fs));
}

hbox(double h) {
  return SizedBox(height: h);
}

wbox(double w) {
  return SizedBox(width: w);
}

final List<Map<String, dynamic>> itemsMenu = [
  {"icon": AssetsHelper.icPbb, "label": "PBB"},
  {"icon": AssetsHelper.icListrik, "label": "Listrik"},
  {"icon": AssetsHelper.icPulsa, "label": "Pulsa"},
  {"icon": AssetsHelper.icPdam, "label": "PDAM"},
  {"icon": AssetsHelper.icPgn, "label": "PGN"},
  {"icon": AssetsHelper.icTelevisi, "label": "Televisi"},
  {"icon": AssetsHelper.icMusik, "label": "Musik"},
  {"icon": AssetsHelper.icGame, "label": "Game"},
  {"icon": AssetsHelper.icMakanan, "label": "Makanan"},
  {"icon": AssetsHelper.icKurban, "label": "Kurban"},
  {"icon": AssetsHelper.icZakat, "label": "Zakat"},
  {"icon": AssetsHelper.icData, "label": "Data"},
];

final List<Map<String, dynamic>> itemsBanner = [
  {"img": AssetsHelper.imgBanner1},
  {"img": AssetsHelper.imgBanner2},
  {"img": AssetsHelper.imgBanner3},
  {"img": AssetsHelper.imgBanner4},
  {"img": AssetsHelper.imgBanner5},
];

final List<Map<String, dynamic>> itemsNominal = [
  {"nominal": 'Rp10.000', 'nilai': '10000'},
  {"nominal": 'Rp20.000', 'nilai': '20000'},
  {"nominal": 'Rp50.000', 'nilai': '50000'},
  {"nominal": 'Rp100.000', 'nilai': '100000'},
  {"nominal": 'Rp250.000', 'nilai': '250000'},
  {"nominal": 'Rp500.000', 'nilai': '500000'}
];

Future<void> showDialogTopUp(BuildContext context, String role, String title,
    String nominal, Function() funcYes, Function() funcNo) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        contentPadding: EdgeInsets.only(top: 10.0),
        content: Container(
          width: Get.width * 0.8,
          height: Get.width * 0.6,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                hbox(10),
                Image.asset(AssetsHelper.imgLogo, height: 45),
                hbox(15),
                textInter(title, Colors.black, FontWeight.normal, 14),
                textInter('$nominal ?', Colors.black, FontWeight.bold, 16),
                hbox(35),
                InkWell(
                  onTap: funcYes,
                  child: textInter(
                      'Ya, lanjutkan $role', colorRed(), FontWeight.bold, 14),
                ),
                hbox(25),
                InkWell(
                  onTap: funcNo,
                  child: textInter(
                      'Batalkan', Colors.black54, FontWeight.bold, 14),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<void> showDialogSuccess(
  BuildContext context,
  String title,
  String nominal,
  Function() funcYes,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        contentPadding: EdgeInsets.only(top: 10.0),
        content: Container(
          width: Get.width * 0.8,
          height: Get.width * 0.65,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                hbox(10),
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 65,
                ),
                hbox(15),
                textInter(title, Colors.black, FontWeight.normal, 14),
                textInter(nominal, Colors.black, FontWeight.bold, 16),
                hbox(35),
                InkWell(
                  onTap: funcYes,
                  child: textInter(
                      'Kembali ke Beranda', colorRed(), FontWeight.bold, 14),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<void> showDialogFail(
  BuildContext context,
  String title,
  String nominal,
  Function() funcYes,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        contentPadding: EdgeInsets.only(top: 10.0),
        content: Container(
          width: Get.width * 0.8,
          height: Get.width * 0.5,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                hbox(10),
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 65,
                ),
                hbox(15),
                textInter(title, Colors.black, FontWeight.normal, 14),
                textInter(nominal, Colors.black, FontWeight.bold, 16),
                textInter('gagal', Colors.black, FontWeight.normal, 14),
                hbox(35),
                InkWell(
                  onTap: funcYes,
                  child: textInter(
                      'Kembali ke Beranda', colorRed(), FontWeight.bold, 14),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
