// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


// /// Manages the network connectivity status and provides methods to check and handle connectivity changes.
// class NetworkManager extends GetxController {
//   static NetworkManager get instance => Get.find();

//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription; // Corrected type
//   final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

//   /// Initialize the network manager and set up a stream to continually check the connection status.
//   @override
//   void onInit() {
//     super.onInit();
//     _startConnectivityListener();
//   }

//   /// Start listening to connectivity changes.
//   void _startConnectivityListener() {
//     _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
//       _updateConnectionStatus,
//       onError: (error) {
//         debugPrint('Connectivity stream error: $error');
//       },
//     );
//   }

//   /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     _connectionStatus.value = result;
//     if (result == ConnectivityResult.none) {
//       TLoaders.warningSnackBar(title: 'No Internet Connection');
//     }
//   }

//   /// Check the internet connection status.
//   /// Returns `true` if connected, `false` otherwise.
//   Future<bool> isConnected() async {
//     try {
//       final result = await _connectivity.checkConnectivity();
//       return result != ConnectivityResult.none; // Return true if connected
//     } on PlatformException catch (e) {
//       debugPrint('Error checking connectivity: $e');
//       return false;
//     }
//   }

//   /// Dispose or close the active connectivity stream.
//   @override
//   void onClose() {
//     _connectivitySubscription.cancel(); // Cancel the subscription
//     super.onClose();
//   }

//   /// Returns the current connection status.
//   ConnectivityResult get currentStatus => _connectionStatus.value;
// }

// /// Example usage of TLoaders, assuming it's a utility for showing snackbars and dialogs.
// class TLoaders {
//   /// Show a snackbar with a warning message.
//   static void warningSnackBar({required String title, String? message}) {
//     Get.snackbar(
//       title,
//       message ?? 'Please check your internet connection.',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.red.withOpacity(0.8),
//       colorText: Colors.white,
//       margin: const EdgeInsets.all(10),
//       duration: const Duration(seconds: 3),
//     );
//   }

//   /// Show a loading dialog.
//   static void showLoading({String? message}) {
//     Get.dialog(
//       Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const CircularProgressIndicator(),
//             if (message != null) ...[
//               const SizedBox(height: 10),
//               Text(message, style: const TextStyle(color: Colors.black)),
//             ],
//           ],
//         ),
//       ),
//       barrierDismissible: false,
//     );
//   }

//   /// Hide the loading dialog.
//   static void hideLoading() {
//     if (Get.isDialogOpen == true) {
//       Get.back();
//     }
//   }
// }
