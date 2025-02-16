import 'dart:io';

import '../../core.dart';

tfPass(String hint, TextEditingController cont, bool stat, bool press,
    Function() func) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: cont.value.text.isEmpty == true && press == true
                ? colorRed()
                : Colors.grey[400],
            width: 0.8)),
    child: Padding(
      padding: EdgeInsets.only(left: 4, right: 4),
      child: TextFormField(
        controller: cont,
        decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: func,
              child: Icon(stat ? Icons.visibility : Icons.visibility_off),
            ),
            hintText: hint,
            prefixIcon: Icon(
              Icons.lock_outline_rounded,
              color: cont.value.text.isEmpty == true && press == true
                  ? colorRed()
                  : Colors.black87,
            ),
            contentPadding: EdgeInsets.only(top: 12, bottom: 10),
            border: InputBorder.none),
        obscureText: stat,
      ),
    ),
  );
}

tfPassProfile(
    String hint, TextEditingController cont, bool stat, Function() func) {
  return Container(
    width: Get.width * 0.9,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 0.8)),
    child: Padding(
      padding: EdgeInsets.only(left: 4, right: 4),
      child: TextFormField(
        controller: cont,
        decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: func,
              child: Icon(stat ? Icons.visibility : Icons.visibility_off),
            ),
            hintText: hint,
            prefixIcon: Icon(
              Icons.lock_outline_rounded,
              color: Colors.black87,
            ),
            contentPadding: EdgeInsets.only(top: 12, bottom: 10),
            border: InputBorder.none),
        obscureText: stat,
      ),
    ),
  );
}

tfEmailProfile(String hint, TextEditingController cont, bool edit) {
  return Container(
    width: Get.width * 0.9,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 0.8)),
    child: Padding(
      padding: EdgeInsets.only(left: 4, right: 4),
      child: TextFormField(
          controller: cont,
          readOnly: true,
          decoration: InputDecoration(
              hintText: hint,
              prefixIcon: Icon(
                Icons.alternate_email_sharp,
                color: Colors.black87,
              ),
              contentPadding: EdgeInsets.only(top: 12, bottom: 10),
              border: InputBorder.none)),
    ),
  );
}

tfEmail(String hint, TextEditingController cont, bool press) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: cont.value.text.isEmpty == true && press == true
                ? colorRed()
                : Colors.grey[400],
            width: 0.8)),
    child: Padding(
      padding: EdgeInsets.only(left: 4, right: 4),
      child: TextFormField(
          controller: cont,
          decoration: InputDecoration(
              hintText: hint,
              prefixIcon: Icon(
                Icons.alternate_email_sharp,
                color: cont.value.text.isEmpty == true && press == true
                    ? colorRed()
                    : Colors.black87,
              ),
              contentPadding: EdgeInsets.only(top: 12, bottom: 10),
              border: InputBorder.none)),
    ),
  );
}

tfRePass(String hint, TextEditingController cont, TextEditingController recont,
    bool stat, bool press, Function() func) {
  return Column(
    children: [
      Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: cont.value.text.isEmpty == true && press == true ||
                        cont.value.text != recont.value.text
                    ? colorRed()
                    : Colors.grey[400],
                width: 0.8)),
        child: Padding(
          padding: EdgeInsets.only(left: 4, right: 4),
          child: TextFormField(
            controller: recont,
            decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: func,
                  child: Icon(stat ? Icons.visibility : Icons.visibility_off),
                ),
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.lock_outline_rounded,
                  color: cont.value.text.isEmpty == true && press == true
                      ? colorRed()
                      : Colors.black87,
                ),
                contentPadding: EdgeInsets.only(top: 12, bottom: 10),
                border: InputBorder.none),
            obscureText: stat,
          ),
        ),
      ),
      cont.value.text != recont.value.text ? hbox(8) : hbox(0),
      cont.value.text != recont.value.text
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                textInterAlignRight('password tidak sama',
                    Colors.red.withOpacity(0.8), FontWeight.w500, 12)
              ],
            )
          : hbox(0)
    ],
  );
}

tf(String hint, IconData icon, TextEditingController cont, bool press) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: cont.value.text.isEmpty == true && press == true
                ? colorRed()
                : Colors.grey[400],
            width: 0.8)),
    child: Padding(
      padding: EdgeInsets.only(left: 4, right: 4),
      child: TextFormField(
        controller: cont,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: cont.value.text.isEmpty == true && press == true
                  ? colorRed()
                  : Colors.black87,
            ),
            contentPadding: EdgeInsets.only(top: 12, bottom: 10),
            border: InputBorder.none),
      ),
    ),
  );
}

tfNormal(String hint, IconData icon, TextEditingController cont) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 0.8)),
    child: Padding(
      padding: EdgeInsets.only(left: 4, right: 4),
      child: TextFormField(
        controller: cont,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: Colors.black87,
            ),
            contentPadding: EdgeInsets.only(top: 12, bottom: 10),
            border: InputBorder.none),
      ),
    ),
  );
}

tfProfile(String hint, IconData icon, TextEditingController cont, bool edit) {
  return Container(
    width: Get.width * 0.9,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 0.8)),
    child: Padding(
      padding: EdgeInsets.only(left: 4, right: 4),
      child: TextFormField(
        readOnly: edit == true ? false : true,
        controller: cont,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: Colors.black87,
            ),
            contentPadding: EdgeInsets.only(top: 12, bottom: 10),
            border: InputBorder.none),
      ),
    ),
  );
}

containerRedButton(String title, Function() func) {
  return InkWell(
    onTap: func,
    child: Container(
      decoration: BoxDecoration(
          color: colorRed(), borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Center(
        child: textInter(title, Colors.white, FontWeight.bold, 16),
      ),
    ),
  );
}

containerGreyButton(String title, bool chooseNominal,
    TextEditingController cont, Function() func) {
  return InkWell(
    onTap: func,
    child: Container(
      decoration: BoxDecoration(
          color: chooseNominal == true ? Colors.grey[400] : colorRed(),
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Center(
        child: textInter(title, Colors.white, FontWeight.bold, 16),
      ),
    ),
  );
}

containerBorderRedButton(String title, Function() func) {
  return InkWell(
    onTap: func,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorRed(), width: 1),
      ),
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Center(
        child: textInter(title, Colors.red, FontWeight.bold, 16),
      ),
    ),
  );
}

rowDaftarDisini() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      textInter('belum punya akun? registrasi', Colors.grey.withOpacity(0.8),
          FontWeight.w400, 14),
      InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.register);
        },
        child: textInter(' di sini', colorRed(), FontWeight.w700, 14),
      )
    ],
  );
}

rowSudahPunyaAkun() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      textInter('sudah punya akun? login', Colors.grey.withOpacity(0.8),
          FontWeight.w400, 14),
      InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.login);
        },
        child: textInter(' di sini', colorRed(), FontWeight.w700, 14),
      )
    ],
  );
}

rowLogo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        AssetsHelper.imgLogo,
        height: 28,
      ),
      wbox(10),
      textInter('SIMS PPOB', Colors.black, FontWeight.bold, 28)
    ],
  );
}

clipImage(String asset, String title) {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(
          asset,
          height: 30,
          fit: BoxFit.cover,
        ),
      ),
      hbox(4),
      textInter(title, Colors.black, FontWeight.w500, 10)
    ],
  );
}

containerBalance(String saldo, bool visible, Function() funcBalance) {
  return Container(
    padding: EdgeInsets.all(25),
    height: Get.height * 0.2,
    width: Get.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(
        image: AssetImage(AssetsHelper.imgBGSaldo),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textInter('Saldo anda', Colors.white70, FontWeight.w600, 14),
        hbox(10),
        textInter('Rp $saldo', Colors.white, FontWeight.bold, 22),
        hbox(10),
        Row(
          children: [
            textInter('Lihat Saldo', Colors.white60, FontWeight.w600, 12),
            wbox(8),
            InkWell(
              onTap: funcBalance,
              child: Icon(
                visible == false ? Icons.visibility : Icons.visibility_off,
                color: Colors.white70,
                size: 14,
              ),
            )
          ],
        )
      ],
    ),
  );
}

gridMenu() {
  return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6, crossAxisSpacing: 15, mainAxisSpacing: 20),
      itemCount: itemsMenu.length,
      itemBuilder: (context, i) {
        return clipImage(itemsMenu[i]['icon'], itemsMenu[i]['label']);
      });
}

AppBar appbarMainMenu(String name, Function() func) {
  return AppBar(
    title: textInter(name, Colors.black87, FontWeight.bold, 14),
    centerTitle: true,
    leadingWidth: 100,
    leading: Padding(
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: func,
        child: Row(
          children: [
            Icon(
              Icons.arrow_back,
              size: 14,
            ),
            wbox(6),
            textInter('Kembali', Colors.black87, FontWeight.w500, 12)
          ],
        ),
      ),
    ),
  );
}

profileEdit(String foto, File? imageFile, Function() tap) {
  return Stack(
    children: [
      Container(
        height: 125,
        width: 125,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: imageFile != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: Image.file(imageFile))
            : foto.contains('https')
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.network(
                      foto,
                      fit: BoxFit.cover,
                    ))
                : Image.asset(AssetsHelper.imgPPBig),
      ),
      // CircleAvatar(
      //   radius: 65,
      //   child: CircleAvatar(
      //     radius: 70,
      //     backgroundImage: AssetImage(AssetsHelper.imgPPBig),
      //   ),
      // ),
      Positioned(
        bottom: 5,
        right: 1,
        child: Container(
          padding: EdgeInsets.all(8),
          child: InkWell(
              onTap: tap,
              child: Icon(Icons.edit, color: Colors.black, size: 16)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 4),
                  color: Colors.black.withOpacity(
                    0.3,
                  ),
                  blurRadius: 3,
                ),
              ]),
        ),
      ),
    ],
  );
}

containerBalancePayment(String saldo) {
  return Container(
    padding: EdgeInsets.all(25),
    height: Get.height * 0.16,
    width: Get.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(
        image: AssetImage(AssetsHelper.imgBGSaldo),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textInter('Saldo anda', Colors.white70, FontWeight.w600, 14),
        hbox(10),
        textInter('Rp $saldo', Colors.white, FontWeight.bold, 22),
      ],
    ),
  );
}
