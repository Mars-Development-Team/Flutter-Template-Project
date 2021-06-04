extension GetPrecision on double {
  double getNumber({int precision = 2}) =>
      double.parse('$this'.substring(0, '$this'.indexOf('.') + precision + 1));
}
