// Proportional Sizes of Device

import 'package:flutter/cupertino.dart';

double kPropWidth(BuildContext context, double precentage) =>
    MediaQuery.of(context).size.width * precentage;

double kPropHeight(BuildContext context, double precentage) =>
    MediaQuery.of(context).size.height * precentage;

EdgeInsets setPaddingMarginAll(double all) => EdgeInsets.all(all);

EdgeInsets setPaddingMarginSym({double? ver, double? hori}) =>
    EdgeInsets.symmetric(horizontal: hori!, vertical: ver!);

// margin & padding

const kV_4 = EdgeInsets.symmetric(vertical: 4.0);
const kH_4 = EdgeInsets.symmetric(horizontal: 4.0);
const kA_4 = EdgeInsets.all(4.0);

const kV_8 = EdgeInsets.symmetric(vertical: 4.0);
const kH_8 = EdgeInsets.symmetric(horizontal: 4.0);
const kA_8 = EdgeInsets.all(4.0);

const kV_16 = EdgeInsets.symmetric(vertical: 16.0);
const kH_16 = EdgeInsets.symmetric(horizontal: 16.0);
const kA_16 = EdgeInsets.all(16.0);

const kVH_8_16 = EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0);
const kVH_16_8 = EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0);
