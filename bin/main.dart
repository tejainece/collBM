import 'dart:collection';
import 'package:quiver/core.dart';

import 'package:collBM/lookup.dart';

main(List<String> args) {
  final lListLookup = lookupList();

  final lSetLookup = lookupSet();

  print("List lookup:");
  print(lListLookup.toString());

  print("Set lookup:");
  print(lSetLookup.toString());
}
