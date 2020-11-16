class UserSettings {
  static String _ipValue = '';
  get ipValue => _ipValue;
  set ipValue(value) => _ipValue = value;

  static List<List<String>> _mockNodesInfoList = [
    ['Johnny01', 'Johnny02', 'Johnny03', 'Johnny04', 'Johnny05', 'Johnny06'],
    ['on', 'on', 'on', 'on', 'off', 'on']
  ];
  get mockNodesInfoList => _mockNodesInfoList;
  void removeNode(index) {
    _mockNodesInfoList[0].removeAt(index);
    _mockNodesInfoList[1].removeAt(index);
  }
}
