class ErrorMessageModel {
  const ErrorMessageModel({
    required this.message,
    required this.statusCode,
    required this.success,
  });

  final int statusCode;
  final String message;
  final bool success;

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        statusCode: json["status_code"],
        message: json["message"],
        success: json["success"],
      );
}
