import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/account_model.dart';
import '../../../data/repositories/account_repository.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository accountRepository;

  AccountBloc({required this.accountRepository}) : super(AccountInitial()) {
    on<FetchAccountDetails>(_onFetchAccountDetails);
  }

  void _onFetchAccountDetails(
    FetchAccountDetails event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountLoading());
    try {
      final account = await accountRepository.fetchAccountDetails(event.accountId);
      emit(AccountLoaded(account));
    } catch (e) {
      emit(AccountError(e.toString()));
    }
  }
}
