import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class PaymentService {
  // Use --dart-define to set this at build time for different environments.
  // Defaults to your production URL if not provided.
  static const String _cloudFunctionBaseUrl = String.fromEnvironment(
    'CLOUD_FUNCTION_BASE_URL',
    defaultValue: 'https://paystack-jznc6my6oa-uc.a.run.app',
  );

  /// Initializes a Paystack payment and launches the payment URL.
  ///
  /// Throws an [Exception] if the user is not logged in, or if the
  /// API call fails.
  Future<void> fundWallet({
    required double amount,
    required String email,
    String? channel, // New optional parameter
  }) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception(
        'User not authenticated. Please log in to fund your wallet.',
      );
    }

    // The specific endpoint for initializing a transaction
    final String initializeUrl =
        '$_cloudFunctionBaseUrl/initialize-transaction';

    final Map<String, dynamic> requestBody = {
      'amount': amount,
      'email': email,
      'metadata': {'userId': user.uid},
      if (channel != null) 'channel': channel,
    };

    try {
      final response = await http.post(
        Uri.parse(initializeUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200 && responseData['status'] == true) {
        // Use null-safe access to prevent crashes if the key is missing.
        final String? authorizationUrl =
            responseData['data']?['authorization_url'];
        if (authorizationUrl != null) {
          final uri = Uri.parse(authorizationUrl);
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          throw Exception('Payment URL not found in the response.');
        }
      } else {
        final String errorMessage =
            responseData['message'] ?? 'An unknown error occurred.';
        throw Exception('Failed to initialize payment: $errorMessage');
      }
    } on PlatformException {
      // This can happen if the user doesn't have a browser or if the OS blocks the launch.
      throw Exception(
        'Could not open the payment page. Please ensure you have a web browser installed.',
      );
    } on SocketException {
      // This handles cases where there is no internet connection.
      throw Exception(
        'Network error. Please check your internet connection and try again.',
      );
    } catch (e) {
      // Re-throw the exception to be caught by the UI layer.
      // This preserves the specific error message from the previous steps.
      throw e;
    }
  }
}
