library collBM.lookup;

import 'dart:math';
import '';

/*
void lookupLinkedHashSet() {
  LinkedHashSet<int> lLHSet = new LinkedHashSet<int>(
      equals: (int aA, int aB) => true
  );
}
*/

class LookupResults {
  LookupResults(this.insertVisits, this.findVisits);

  final VisitCounts insertVisits;

  final VisitCounts findVisits;

  String toString() {
    var lRet  =   "Insert: ${insertVisits.toString()}\n";
    lRet      +=  "Find  : ${findVisits.toString()}\n";

    return lRet;
  }
}

LookupResults lookupList() {
  Random lRand = new Random(5);

  Data.clearVisits();

  List<Data> lList = new List<Data>();

  for(int cIdx = 0; cIdx < 1000; cIdx++) {
    lList.add(new Data(cIdx * 5, cIdx));
  }

  final lInsertCounts = new VisitCounts.FromData();

  Data.clearVisits();

  Data lFound = lList.firstWhere((Data aData) => aData == new Data(2500, null));

  assert(lFound.data == 2500/5);

  final lFindCounts = new VisitCounts.FromData();

  Data.clearVisits();

  return new LookupResults(lInsertCounts, lFindCounts);
}

LookupResults lookupSet() {
  Random lRand = new Random(5);

  Data.clearVisits();

  Set<Data> lSet = new Set<Data>();

  for(int cIdx = 0; cIdx < 1000; cIdx++) {
    lSet.add(new Data(cIdx * 5, cIdx));
  }

  final lInsertCounts = new VisitCounts.FromData();

  Data.clearVisits();

  Data cFound = lSet.lookup(new Data(2500, null));

  assert(cFound.data == 2500/5);

  final lFindCounts = new VisitCounts.FromData();

  Data.clearVisits();

  return new LookupResults(lInsertCounts, lFindCounts);
}