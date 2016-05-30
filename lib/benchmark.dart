library collBM;

class VisitCounts {
  VisitCounts(this.eqVisits, this.hashVisits);

  VisitCounts.FromData() : eqVisits = Data.eqVisits, hashVisits = Data.hashVisits;

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
    eqVisits++;
    if(aOther is! Data) {
      return false;
    }

    return id == aOther.id;
  }

  @override
  int get hashCode  {
    hashVisits++;
    return id.hashCode;
  }

  static int eqVisits = 0;

  static int hashVisits = 0;

  static void clearVisits() {
    eqVisits = 0;
    hashVisits = 0;
  }
}