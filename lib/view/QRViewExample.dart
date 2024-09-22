import 'package:flutter/material.dart';
import 'package:micaniciens_app/controller/QRViewExampleController.dart';
import 'package:micaniciens_app/view/ServiceDetailsPage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
//import 'qr_view_example_controller.dart';
//import 'service_details_page.dart'; // صفحة عرض تفاصيل الخدمة

class QRViewExample extends StatefulWidget {
  final String ID1;
  const QRViewExample({super.key, required this.ID1});
  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? serviceID;
  bool isServiceDetected = false; // متغير لتتبع اكتشاف الخدمة
  final qrController = QRViewExampleController();

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.green,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                serviceID != null
                    ? Text('ID: $serviceID')
                    : Text('Scan a code'),
                if (isServiceDetected)
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        print('Fetching service details for ID: $serviceID');
                        var serviceDetails = await qrController.getServiceDetails(serviceID!);
                        print('Service Details: $serviceDetails');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceDetailsPage(
                              serviceDetails: serviceDetails,
                              ID1: widget.ID1,
                              onUpdateStatus: (String newStatus) {
                                Navigator.pop(context); // العودة بعد تحديث الخدمة
                              },
                            ),
                          ),
                        );
                      } catch (error) {
                        print('Error fetching service details: $error');
                      }
                    },
                    child: Text('View Service Details'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        serviceID = scanData.code; // استخراج معرف الخدمة من QR
        print('Scanned Service ID: $serviceID'); // التحقق من القيمة
        isServiceDetected = true; // تفعيل الزر
      });
      controller.pauseCamera(); // إيقاف الكاميرا بعد المسح
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}



/*class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? serviceID;
  final qrController = QRViewExampleController();

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.green,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: serviceID != null
                  ? Text('Service ID: $serviceID')
                  : Text('Scan a code'),
            ),
          ),
        ],
      ),
    );
  }

 /* void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        serviceID = scanData.code; // استخراج المعرف من QR
      });
      controller.pauseCamera(); // إيقاف الكاميرا بعد المسح

      // جلب بيانات الخدمة باستخدام serviceID
      try {
        var serviceDetails = await qrController.getServiceDetails(serviceID!);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceDetailsPage(serviceDetails: serviceDetails),
          ),
        );
      } catch (error) {
        print('Error fetching service details: $error');
      }
    });
  }*/
  void _onQRViewCreated(QRViewController controller) {
  this.controller = controller;
  controller.scannedDataStream.listen((scanData) async {
    setState(() {
      serviceID = scanData.code; // استخراج المعرف من QR
    });
    controller.pauseCamera(); // إيقاف الكاميرا بعد المسح

    // جلب بيانات الخدمة باستخدام serviceID
    try {
      var serviceDetails = await qrController.getServiceDetails(serviceID!);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ServiceDetailsPage(
            serviceDetails: serviceDetails,
            onUpdateStatus: (String newStatus) {
              // هنا يمكن إرسال حالة جديدة للخادم لتحديث الخدمة
              // ثم يمكن إعادة توجيه المستخدم بناءً على النتيجة
              Navigator.pop(context); // العودة بعد تحديث الخدمة
              // يمكنك هنا إضافة توجيه إضافي إذا لزم الأمر
            },
          ),
        ),
      );
    } catch (error) {
      print('Error fetching service details: $error');
    }
  });
}


  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}*/
