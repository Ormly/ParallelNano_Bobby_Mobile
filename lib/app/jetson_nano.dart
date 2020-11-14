//TODO: Remove this class

class JetsonNano {
  String _ipAddress, _nodeStatus, _cpuUsage, _memoryUsage, _gpuUsage;
  final String _cpuModel, _nodeName;

  JetsonNano(this._cpuModel, this._nodeName);

  Map<String, dynamic> get map {
    return {
      'ipAddress': _ipAddress,
      'nodeStatus': _nodeStatus,
      'cpuUsage': _cpuUsage,
      'memoryUsage': _memoryUsage,
      'gpuUSage': _gpuUsage,
      'cpuModel': _cpuModel,
    };
  }

  get nodeStatus => _nodeStatus;

  get nodeName => _nodeName;

  set ipAddress(ipAddress) {
    _ipAddress = ipAddress;
  }

  set nodeStatus(nodeStatus) {
    _nodeStatus = nodeStatus;
  }

  set cpuUsage(cpuUsage) {
    _cpuUsage = cpuUsage;
  }

  set memoryUsage(memoryUsage) {
    _memoryUsage = memoryUsage;
  }

  set gpuUsage(gpuUsage) {
    _gpuUsage = gpuUsage;
  }
}
