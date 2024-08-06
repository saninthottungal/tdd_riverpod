import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required List<dynamic> props}) : _props = props;
  final List<dynamic> _props;

  @override
  List<Object?> get props => _props;
}
