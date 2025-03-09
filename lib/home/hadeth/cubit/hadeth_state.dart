

import '../../../model/hadetModel.dart';

abstract class HadethState  {
  const HadethState();

  @override
  List<Object> get props => [];
}

class HadethInitial extends HadethState {}

class HadethLoading extends HadethState {}

class HadethLoaded extends HadethState {
  final List<HadethModel> hadethList;

  const HadethLoaded(this.hadethList);

  @override
  List<Object> get props => [hadethList];
}

class HadethError extends HadethState {
  final String message;

  const HadethError(this.message);

  @override
  List<Object> get props => [message];
}