import 'package:flutter/material.dart';

import '../GlobalVariables/device_configs.dart';
import '../GlobalVariables/global_widgets.dart';

/*
  Serves currently as sample page
 */

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 55+DeviceConfigs.topOffset()),
          child: Container(
              height: 55+DeviceConfigs.topOffset(),
              padding: EdgeInsets.only(top: DeviceConfigs.topOffset()),
              color: Theme.of(context).colorScheme.tertiaryContainer,
              alignment: Alignment.center,
              child: GlobalWidgets.sparklii(context)
          )
      ),
      body: GlobalWidgets.comingSoon(context, "Custom Shop Coming Soon!", Icons.shopping_cart),
    );
  }
}
