import 'package:flutter/material.dart';

class TextChangePasswordFieldContainer extends StatelessWidget {
  final Widget child;
  const TextChangePasswordFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.85,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.32),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
