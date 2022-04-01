// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import '../../app/data/constant.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ShimLoad extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var container = Container(
//       margin: EdgeInsets.all(12),
//       height: 100,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withOpacity(.1),
//               offset: Offset(5, 5),
//               blurRadius: 10,
//               spreadRadius: 2)
//         ],
//       ),
//     );
//     return Container(
//       width: double.infinity,
//       child: Shimmer.fromColors(
//         baseColor: Colors.grey[300]!,
//         highlightColor: Colors.grey[100]!,
//         // enabled: _enabled,
//         child: Column(
//           children: [
//             container,
//             container,
//             container,
//             container,
//             container,
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ShimGridLoad extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var container = Container(
//       margin: EdgeInsets.all(12),
//       height: 100,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withOpacity(.1),
//               offset: Offset(5, 5),
//               blurRadius: 10,
//               spreadRadius: 2)
//         ],
//       ),
//     );
//     return Container(
//       width: double.infinity,
//       child: Shimmer.fromColors(
//           baseColor: Colors.grey[300]!,
//           highlightColor: Colors.grey[100]!,
//           // enabled: _enabled,
//           child: GridView.builder(
//               padding: EdgeInsets.all(8),
//               itemCount: 8,
//               physics: BouncingScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount:
//                     MediaQuery.of(context).orientation == Orientation.landscape
//                         ? 3
//                         : 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 1.1,
//               ),
//               itemBuilder: (context, i) {
//                 return Container(
//                   padding: EdgeInsets.all(8),
//                   // height: 150.h,
//                   // width: 180.w,
//                   decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(.9),
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.black.withOpacity(.2),
//                             offset: Offset(4, 3)),
//                       ]),
//                 );
//               })),
//     );
//   }
// }

// class TestApi extends StatelessWidget {
//   String url = "https://jsonplaceholder.typicode.com/posts";
//   Future getBooks() async {
//     final response =
//         await Dio().get("http://192.168.1.41:8000/api/getallcandidate");

//     if (response.statusCode == 200) {
//       print(response.data);
//     } else {
//       throw Exception();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     getBooks();
//     return Container();
//   }
// }

// class ShimLoadTable extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SpinKitCubeGrid(
//         color: kPrimaryColor,
//         size: 50.h,
//       ),
//     );
//   }
// }
