import 'package:flutter/material.dart';

class CustomSeperator extends StatelessWidget {
  const CustomSeperator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey.withOpacity(.1),
      thickness: 1,
      height: 8,
    );
  }
}
