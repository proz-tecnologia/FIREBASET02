abstract class RecoveryPasswordState {}

class RecoveryStateEmpty extends RecoveryPasswordState {}

class RecoveryStateLoading extends RecoveryPasswordState {}

class RecoveryStateSuccess extends RecoveryPasswordState {}

class RecoveryStateError extends RecoveryPasswordState {}
