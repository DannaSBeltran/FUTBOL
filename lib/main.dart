import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LiveStreamScreen(),
    );
  }
}

class LiveStreamScreen extends StatefulWidget {
  @override
  _LiveStreamScreenState createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  late InAppWebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    // No es necesario hacer nada específico en este caso para Web.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transmisión en Vivo'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse('https://www.capoplayer.net/play/winsportsplus.php'), // Tu URL de transmisión
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
        },
        onLoadStart: (InAppWebViewController controller, Uri? url) {
          // Aquí puedes agregar un cargador o algo mientras se carga la página.
        },
        onLoadStop: (InAppWebViewController controller, Uri? url) {
          // Aquí puedes hacer algo cuando la página termine de cargar.
        },
        onProgressChanged: (InAppWebViewController controller, int progress) {
          // Este callback puede usarse para manejar la carga de la página.
        },
      ),
    );
  }
}
