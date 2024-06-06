import 'package:flutter/material.dart';

class ContentButton extends StatelessWidget {
  const ContentButton(
      {super.key,
      required this.contentIcon,
      required this.content,
      required this.contentSize,
      required this.detailWidget});

  final IconData contentIcon;
  final String content;
  final double contentSize;
  final Widget detailWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(1.0, 0.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            pageBuilder: (context, anmation, secondaryAnimation) =>
                detailWidget,
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black26),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 5,
              ),
              Icon(
                contentIcon,
                color: Colors.black38,
                size: 45,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                content,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: contentSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
