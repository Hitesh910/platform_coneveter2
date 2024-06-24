import 'package:permission_handler/permission_handler.dart';

class PermissionHandle
{
  int? no;
  Future<void> checkPermission()
  async {
   var Status = await Permission.photos.status;

   if(Status.isGranted)
     {
       print("Permission is Granted");
     }
   else if(Status.isDenied)
     {
       print("Permission Denied");
     }
   else
     {
       Permission.photos.request();
     }
  }
}