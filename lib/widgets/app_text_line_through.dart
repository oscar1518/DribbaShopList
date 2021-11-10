import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextLineThorough extends StatelessWidget {
  final String text;
  final Color color;
  final double size;


  const AppTextLineThorough(this.text, this.size, this.color, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('$text',
        style: GoogleFonts.nunito(color: color, fontSize: size, fontWeight: FontWeight.bold, 
        textStyle: TextStyle(
          decoration: TextDecoration.lineThrough
          )
          ));
  }
}
