import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;


  const AppText(this.text, this.size, this.color, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('$text',
        style: GoogleFonts.nunito(color: color, fontSize: size, fontWeight: FontWeight.bold
          ));
  }
}
