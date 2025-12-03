import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled36/splash_screen.dart';
import 'data/providers/api_provider.dart';
import 'data/repositories/account_repository.dart';
import 'presentation/blocs/account_bloc/account_bloc.dart';
import 'presentation/screens/account_details_screen.dart';

void main() {
  // Initialize core dependencies
  final apiProvider = ApiProvider();
  final accountRepository = AccountRepository(apiProvider: apiProvider);

  runApp(MyApp(accountRepository: accountRepository));
}

class MyApp extends StatelessWidget {
  final AccountRepository accountRepository;

  const MyApp({super.key, required this.accountRepository});

  @override
  Widget build(BuildContext context) {
    // Define a professional banking theme (Deep Teal and Gold/Amber)
    final Color primaryColor = Color(0xFF004D40); // Deep Teal
    final Color accentColor = Color(0xFFFFC107); // Amber/Gold

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AccountRepository>(
          create: (context) => accountRepository,
        ),
      ],
      child: MaterialApp(
        title: 'Advanced Banking System',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
            primary: primaryColor,
            secondary: accentColor,
            surface: Colors.white,
            onSurface: Colors.black87,
          ),
          scaffoldBackgroundColor: Colors.grey[50],
          appBarTheme: AppBarTheme(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(color: Colors.black87),
          ),
          // Custom button style for a modern look
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: accentColor,
              foregroundColor: primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        home: BlocProvider(
          create: (context) => AccountBloc(
            accountRepository: context.read<AccountRepository>(),
          )..add(const FetchAccountDetails('acc_12345')), // Fetch mock data on start
          child: SplashScreen(),
        ),
      ),
    );
  }
}
