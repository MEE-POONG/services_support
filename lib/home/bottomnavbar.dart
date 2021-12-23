import 'package:flutter/material.dart';
import 'package:services_support/home/home.dart';
import 'package:services_support/check_name/check_name.dart';
import 'package:services_support/menu_page/report.dart';
import 'package:services_support/menu_page/work.dart';
import 'package:services_support/menu_page/working/working.dart';

class BottomNavBarFb5 extends StatefulWidget {
  const BottomNavBarFb5({
    Key? key,
    required this.i,
  }) : super(key: key);

  final int i;
  @override
  _BottomNavBarFb5State createState() => _BottomNavBarFb5State();
}

class _BottomNavBarFb5State extends State<BottomNavBarFb5> {
  final primaryColor = const Color(0xff4338CA);

  final secondaryColor = const Color(0xff6D28D9);

  final accentColor = const Color(0xffffffff);

  final backgroundColor = const Color(0xffffffff);

  final errorColor = const Color(0xffEF4444);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xff4338CA), Color(0xff6D28D9)]),
      ),
      child: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                    text: "Home",
                    icon: Icons.home,
                    selected: widget.i == 1,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                        (Route<dynamic> route) => false,
                      );
                    }),
                IconBottomBar(
                    text: "เช็คชื่อ",
                    icon: Icons.people_alt,
                    selected: widget.i == 2,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => CheckName()),
                        (Route<dynamic> route) => false,
                      );
                    }),
                IconBottomBar(
                    text: "รับงาน",
                    icon: Icons.search_outlined,
                    selected: widget.i == 3,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Work()),
                        (Route<dynamic> route) => false,
                      );
                    }),
                IconBottomBar(
                    text: "ทำงาน",
                    icon: Icons.construction,
                    selected: widget.i == 4,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Working()),
                        (Route<dynamic> route) => false,
                      );
                    }),
                IconBottomBar(
                  text: "Report",
                  icon: Icons.history_edu,
                  selected: widget.i == 5,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Report()),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon:
              Icon(icon, size: 25, color: selected ? accentColor : Colors.grey),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              height: .1,
              color: selected ? accentColor : Colors.grey),
        )
      ],
    );
  }
}
