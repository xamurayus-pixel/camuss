import 'package:flutter/material.dart';
import 'services/camera_discovery_service.dart';

void main() {
  runApp(const CamussApp());
}

class CamussApp extends StatelessWidget {
  const CamussApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAMUSS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const TelaPrincipal(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final _descoberta = CameraDiscoveryService();
  bool _buscando = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CAMUSS'),
        centerTitle: true,
      ),
      body: Center(
        child: _buscando
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Procurando câmeras na rede...'),
                ],
              )
            : ElevatedButton(
                onPressed: _iniciarBusca,
                child: const Text('Procurar Câmeras'),
              ),
      ),
    );
  }

  Future<void> _iniciarBusca() async {
    setState(() => _buscando = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _buscando = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Busca concluída!')),
      );
    }
  }
}