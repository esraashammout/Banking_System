part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class FetchAccountDetails extends AccountEvent {
  final String accountId;

  const FetchAccountDetails(this.accountId);

  @override
  List<Object> get props => [accountId];
}
