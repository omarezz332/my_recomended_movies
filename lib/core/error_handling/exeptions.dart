import '../network/error_message_model.dart';

class ServerException implements Exception {
  const ServerException({required this.errorMessage});
  final ErrorMessageModel errorMessage;

}
class LocalStorageException implements Exception {
  const LocalStorageException({required this.errorMessage});
  final String errorMessage;

}