library collBM;

class VisitCounts {
  VisitCounts(this.eqVisits, this.hashVisits);

  //VisitCounts.FromData() : eqVisits = Data.eqVisits, hashVisits = Data.hashVisits;

  VisitCounts.FromDataClear() : eqVisits = Data._eqVisits, hashVisits = Data._hashVisits {
    Data.clearVisits();
  }

  final int eqVisits;

  final int hashVisits;

  String toString() => "Equality: ${eqVisits} Hashcode: ${hashVisits}";
}

class Data {
  Data(this.id, this.data);

  final int id;

  final int data;

  @override
  bool operator==(Data aOther) {
    _eqVisits++;
    if(aOther is! Data) {
      return false;
    }

    return id == aOther.id;
  }

  @override
  int get hashCode  {
    _hashVisits++;
    return id.hashCode;
  }

  static int _eqVisits = 0;

  static int _hashVisits = 0;

  static void clearVisits() {
    _eqVisits = 0;
    _hashVisits = 0;
  }
}