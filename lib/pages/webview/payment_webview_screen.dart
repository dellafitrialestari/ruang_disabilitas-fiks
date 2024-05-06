import 'package:flutter/material.dart';
import 'package:ruang_disabilitas/flutter_flow/flutter_flow_util.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebviewScreen extends StatefulWidget {
  const PaymentWebviewScreen({required this.invoiceUrl, super.key});

  final String? invoiceUrl;

  @override
  State<PaymentWebviewScreen> createState() => _PaymentWebviewScreenState();
}

class _PaymentWebviewScreenState extends State<PaymentWebviewScreen> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6CC166),
        title: Text("Pembayaran"),
        leading: GestureDetector(onTap: () {
          context.pushReplacement('/');
        }, child: Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body: SafeArea(child: WebViewWidget(controller: controller)),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            debugPrint("started pembayaran : $url");
          },
          onPageFinished: (String url) {
            if(url.contains("https://ruang-disabilitas.monevadmin.id/callback/")) {
              context.pushReplacement('/');
            }
            debugPrint("finished pembayaran : $url");
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint("error pembayaran : ${error.description}");
          },
          onNavigationRequest: (NavigationRequest request) {
          //   // if (request.url.startsWith('https://www.youtube.com/')) {
          //   //   return NavigationDecision.prevent;
          //   // }
          //   // return NavigationDecision.navigate;
            debugPrint("request pembayaran : ${request.url}");
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.invoiceUrl ?? "http://localhost"));
  }

  // Future<String?> postPayment(int? amount, String? email, String packageClass) async {
  //   final fcm = FirebaseMessaging.instance;
  //   final fcmToken = await fcm.getToken();
  //   final url = 'https://api.xendit.co/v2/invoices';
  //   // final url = 'https://ruang-disabilitas.monevadmin.id/callback';
  //   final headers = {
  //     /// TEST API KEY
  //     'Authorization': 'Basic eG5kX2RldmVsb3BtZW50X1A0cURmT3NzME9DcGw4UnRLclJPSGphUVlOQ2s5ZE41bFNmaytSMWw5V2JlK3JTaUN3WjNqdz09Og==',
  //     /// LIVE API KEY
  //     // 'Authorization': 'Basic eG5kX3Byb2R1Y3Rpb25fUER2bXNuUnN5RDNHSUxPU2pNcnpPNkhENXhJOUlLd3BSOXFzTTc4SkFFdzFScTlPVkFhREVYek9STVNQVjU6',
  //     'Content-Type': 'application/json',
  //   };
  //   final body = {
  //     'external_id': currentUserUid,
  //     'amount': amount, // Amount in the smallest currency unit (e.g., cents)
  //     'payer_email': email,
  //     // 'user_id': currentUserUid,
  //     'description': {
  //       "paket": packageClass,
  //       "device_id": fcmToken,
  //       "uid": currentUserUid
  //     }.toString()
  //   };
  //
  //   final response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
  //
  //   if (response.statusCode == 200) {
  //     // Payment initiated successfully, handle the response
  //     // You might want to open a WebView to complete the payment or
  //     // redirect the user to a payment URL.
  //     // Consult Xendit's documentation for the next steps.
  //     print(response.body);
  //     var res = jsonDecode(response.body);
  //     return res['invoice_url'];
  //   } else {
  //     // Handle the error case
  //     print('Payment initiation failed: ${response.body}');
  //     return null;
  //   }
  // }
}


