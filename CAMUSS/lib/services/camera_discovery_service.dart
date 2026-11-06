class CameraDevice {
  final String ip;
  final int porta;
  final String? usuario;
  final String? senha;

  CameraDevice({
    required this.ip,
    required this.porta,
    this.usuario,
    this.senha,
  });
}

class CameraDiscoveryService {
  final List<int> _portasComuns = [554, 80, 8080, 37777];
  
  final List<Map<String, String>> _credenciaisPadrao = [
    {'usuario': 'admin', 'senha': 'admin'},
    {'usuario': 'admin', 'senha': ''},
    {'usuario': 'root', 'senha': 'root'},
  ];

  Future<List<CameraDevice>> buscarNaRede() async {
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }
}