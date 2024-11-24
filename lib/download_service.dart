import 'dart:async';
import 'dart:developer';
// import 'dart:typed_data';

// import 'package:dio/dio.dart';
// import 'package:download/main.dart';

// class DownloadService {
//   Future<Function(double progress, Uint8List imageByte)> download(String path) async {
//     try {
      
//       final response = await dio.get(
//         "https://images.pexels.com/photos/5634600/pexels-photo-5634600.jpeg?cs=srgb&dl=pexels-gabby-k-5634600.jpg&fm=jpg&_gl=1*n7480b*_ga*MzU4MTQzMDY3LjE3MzIyMDQ2Njc.*_ga_8JE65Q40S6*MTczMjIwNDY2Ny4xLjEuMTczMjIwNTYzNC4wLjAuMA..",
//         onReceiveProgress: (value, total) {
//           log("Progress1 $value");
//           log("Progress2: $total");
//           final percentage = (value/total)*100;
          
          
//         },
//         options: Options(responseType: ResponseType.bytes)
//       );
//       if (response.statusCode == 200) {
//         log("Downloaded");
//         final image = response.data as Uint8List;
        
//       }else{
//         log("Error");
//         throw Exception("Other response");
//       }
//     } on DioException catch (e) {
//       log("DioException:- $e");
//       throw Exception("Dio Exception $e");
//     } catch (e) {
//       log("Other Exception:- $e");
//       throw Exception("Other Exception $e");
//     }
//   }
// }
