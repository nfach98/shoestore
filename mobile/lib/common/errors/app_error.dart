import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final String? title;
  final String message;

  final int? status;

  const AppError(this.message, {this.title, this.status});

  @override
  List<Object?> get props => [message, title, status];
}
