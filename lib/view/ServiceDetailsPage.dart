/*import 'package:flutter/material.dart';

class ServiceDetailsPage extends StatelessWidget {
  final Map<String, dynamic> serviceDetails;

  ServiceDetailsPage({required this.serviceDetails, required Null Function(String newStatus) onUpdateStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service Name: ${serviceDetails['serviceName']}'),
            Text('Date: ${serviceDetails['date']}'),
            Text('Time: ${serviceDetails['time']}'),
            Text('Car Type: ${serviceDetails['carType']}'),
            Text('Price: ${serviceDetails['prix']}'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // تنفيذ الإجراء إذا كانت الخدمة قد اكتملت
                    // يمكنك تنفيذ تحديث الحالة هنا وإعادة توجيه المستخدم
                  },
                  child: Text('Complete Service'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // تنفيذ الإجراء إذا كانت الخدمة لم تكتمل
                    // يمكنك تحديث الحالة هنا وإعادة توجيه المستخدم
                  },
                  child: Text('Incomplete Service'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/

///
/*import 'package:flutter/material.dart';

class ServiceDetailsPage extends StatelessWidget {
  final Map<String, dynamic> serviceDetails;
  final Function(String) onUpdateStatus; // إضافة هذه الخاصية لقبول حالة جديدة

  ServiceDetailsPage({
    required this.serviceDetails,
    required this.onUpdateStatus, // إضافة هنا أيضًا
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service Name: ${serviceDetails['serviceName']}'),
            Text('Date: ${serviceDetails['date']}'),
            Text('Time: ${serviceDetails['time']}'),
            Text('Car Type: ${serviceDetails['carType']}'),
            Text('Price: ${serviceDetails['prix']}'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // تنفيذ الإجراء إذا كانت الخدمة قد اكتملت
                    onUpdateStatus('complete'); // تحديث الحالة عند اكتمال الخدمة
                  },
                  child: Text('Complete Service'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // تنفيذ الإجراء إذا كانت الخدمة لم تكتمل
                    onUpdateStatus('incomplete'); // تحديث الحالة عند عدم اكتمال الخدمة
                  },
                  child: Text('Incomplete Service'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/
///
/*
import 'package:flutter/material.dart';

class ServiceDetailsPage extends StatelessWidget {
  final Map<String, dynamic> serviceDetails;
  final Function(String) onUpdateStatus; // دالة للتعامل مع تغيير الحالة

  ServiceDetailsPage({
    required this.serviceDetails,
    required this.onUpdateStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service Name: ${serviceDetails['serviceName']}'),
            Text('Date: ${serviceDetails['date']}'),
            Text('Time: ${serviceDetails['time']}'),
            Text('Car Type: ${serviceDetails['carType']}'),
            Text('Price: ${serviceDetails['prix']}'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    onUpdateStatus('complete'); // تغيير الحالة عند اكتمال الخدمة
                    Navigator.pop(context); // العودة إلى الصفحة السابقة بعد تغيير الحالة
                  },
                  child: Text('Réparation commencée'),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:micaniciens_app/controller/Notificationscontroller.dart';

class ServiceDetailsPage extends StatelessWidget {
  final Map<String, dynamic> serviceDetails;
  final Function(String) onUpdateStatus;

  ServiceDetailsPage({
    required this.serviceDetails,
    required this.onUpdateStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service Name: ${serviceDetails['serviceName']}'),
            Text('Date: ${serviceDetails['date']}'),
            Text('Time: ${serviceDetails['time']}'),
            Text('Car Type: ${serviceDetails['carType']}'),
            Text('Price: ${serviceDetails['prix']}'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    try {
                      print(
                          'Service ID: ${serviceDetails['_id']}'); // التحقق من أن المعرف ليس null
                      print('ITA Value: Réparation commencée');
                      // تحديث حالة الخدمة إلى "Réparation commencée"
                      await Notificationscontroller.updateServiceIta(serviceDetails['_id'], 'Réparation commencée');

                      // تنفيذ الإجراء الإضافي الذي ترغب فيه عند تغيير الحالة
                      onUpdateStatus('complete');

                      // الرجوع إلى الصفحة السابقة
                      Navigator.pop(context);

                      // عرض رسالة نجاح
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('Service status updated successfully')),
                      );
                    } catch (error) {
                      // في حالة وجود خطأ
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Failed to update service status: $error')),
                      );
                    }
                  },
                  child: Text('Réparation commencée'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
