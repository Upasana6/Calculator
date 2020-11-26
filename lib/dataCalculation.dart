class Data {
  List<String> val = new List();

  void addData(String temp) {
    val.add(temp);
  }

  void clearData() {
    val.clear();
  }

  double _l;

  double calc() {
    for (int i = 0; i < val.length; i++) {
      if (val[1] == null || val[2] == null || val[0] == null) {
        print('null value $val[0] $val[1] $val[2]');
      } else if (val[1] == '+') {
        _l = double.parse(val[0]) + double.parse(val[2]);
      } else if (val[1] == '-') {
        _l = double.parse(val[0]) - double.parse(val[2]);
      } else if (val[1] == 'X') {
        _l = double.parse(val[0]) * double.parse(val[2]);
      } else if (val[1] == '/') {
        _l = double.parse(val[0]) / double.parse(val[2]);
        print('$val[0] / $val[2]');
      }
    }

    return _l;
  }
}
