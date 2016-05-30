library collBM.lookup;

import 'package:collBM/benchmark.dart';

class LookupResults {
  LookupResults(this.insert, this.find, this.firstWhere, this.contains);

  final VisitCounts insert;

  final VisitCounts find;

  final VisitCounts firstWhere;

  final VisitCounts contains;

  String toString() {
    var lRet  =   "Insert     : ${insert.toString()}\n";
    lRet      +=  "Find       : ${find.toString()}\n";
    lRet      +=  "FirstWhere : ${firstWhere.toString()}\n";
    lRet      +=  "Contains   : ${contains.toString()}\n";

    return lRet;
  }
}

/*
void lookupLinkedHashSet() {
  LinkedHashSet<int> lLHSet = new LinkedHashSet<int>(
      equals: (int aA, int aB) => true
  );
}
*/

LookupResults lookupList() {
  Data.clearVisits();

  //1. Insert
  List<Data> lList = new List<Data>();

  for(int cIdx = 0; cIdx < 1000; cIdx++) {
    lList.add(new Data(cIdx * 5, cIdx));
  }

  final lInsertCounts = new VisitCounts.FromDataClear();

  final lTarget = new Data(2500, null);

  //2. Find
  {
    Data lFound;
    for(Data cData in lList) {
      if(cData == lTarget) {
        lFound = cData;
        break;
      }
    }

    assert(lFound.data == 2500/5);
  }

  final lFindCounts = new VisitCounts.FromDataClear();

  {
    Data lFound = lList.firstWhere((Data aData) => aData == lTarget);
    assert(lFound.data == 2500/5);
  }

  final lFirstWhereCounts = new VisitCounts.FromDataClear();

  {
    assert(lList.contains(lTarget) == true);
  }

  final lContainsCounts = new VisitCounts.FromDataClear();

  return new LookupResults(lInsertCounts, lFindCounts, lFirstWhereCounts, lContainsCounts);
}

LookupResults lookupSet() {
  Data.clearVisits();

  Set<Data> lSet = new Set<Data>();

  for(int cIdx = 0; cIdx < 1000; cIdx++) {
    lSet.add(new Data(cIdx * 5, cIdx));
  }

  final lInsertCounts = new VisitCounts.FromDataClear();

  final lTarget = new Data(2500, null);

  {
    Data cFound = lSet.lookup(lTarget);
    assert(cFound.data == 2500 / 5);
  }

  final lFindCounts = new VisitCounts.FromDataClear();

  {
    Data lFound = lSet.firstWhere((Data aData) => aData == lTarget);
    assert(lFound.data == 2500/5);
  }

  final lFirstWhereCounts = new VisitCounts.FromDataClear();

  {
    assert(lSet.contains(lTarget) == true);
  }

  final lContainsCounts = new VisitCounts.FromDataClear();

  return new LookupResults(lInsertCounts, lFindCounts, lFirstWhereCounts, lContainsCounts);
}

LookupResults lookupMap() {
  Data.clearVisits();

  Map<Data, Data> lMap = new Map<Data, Data>();

  for(int cIdx = 0; cIdx < 1000; cIdx++) {
    lMap[new Data(cIdx * 5, 0)] = new Data(cIdx * 5, cIdx);
  }

  final lInsertCounts = new VisitCounts.FromDataClear();

  final lTarget = new Data(2500, null);

  {
    Data cFound = lMap[lTarget];
    assert(cFound.data == 2500 / 5);
  }

  final lFindCounts = new VisitCounts.FromDataClear();

  {
    Data cFound = lMap[lTarget];
    assert(cFound.data == 2500 / 5);
  }

  final lFirstWhereCounts = new VisitCounts.FromDataClear();

  {
    assert(lMap.containsKey(lTarget) == true);
  }

  final lContainsCounts = new VisitCounts.FromDataClear();

  return new LookupResults(lInsertCounts, lFindCounts, lFirstWhereCounts, lContainsCounts);
}