import 'package:equatable/equatable.dart';

class AccountModel extends Equatable {
  final String id;
  final String accountNumber;
  final String accountType; // savings, checking, loan, investment
  final double balance;
  final String status; // active, frozen, suspended, closed
  final String customerName;

  const AccountModel({
    required this.id,
    required this.accountNumber,
    required this.accountType,
    required this.balance,
    required this.status,
    required this.customerName,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'] as String,
      accountNumber: json['accountNumber'] as String,
      accountType: json['accountType'] as String,
      balance: (json['balance'] as num).toDouble(),
      status: json['status'] as String,
      customerName: json['customerName'] as String,
    );
  }

  // Mock data for development before backend is ready
  static const AccountModel mockAccount = AccountModel(
    id: 'acc_12345',
    accountNumber: '9876543210',
    accountType: 'Savings',
    balance: 15432.50,
    status: 'active',
    customerName: 'أحمد محمد',
  );

  @override
  List<Object> get props => [id, accountNumber, accountType, balance, status, customerName];
}
