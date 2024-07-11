import 'package:flutter/material.dart';

import '../../theme/app_pallete.dart';

class bottomAppBarWidget extends StatelessWidget {
  const bottomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppPallete.colorPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            color: AppPallete.white,
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          IconButton(
            color: AppPallete.white,
            icon: Icon(Icons.compare_arrows),
            onPressed: () {
              Navigator.pushNamed(context, '/conversion');
            },
          ),
        ],
      ),
    );
  }
}
