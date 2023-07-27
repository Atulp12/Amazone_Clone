import 'package:amazon_clone_app/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_app/constraints/global.dart';
import 'package:amazon_clone_app/constraints/utils.dart';
import 'package:amazon_clone_app/features/Admin/screens/admin_screen.dart';
import 'package:amazon_clone_app/features/auth/Services/auth_service.dart';
import 'package:amazon_clone_app/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_app/providers/user_provider.dart';
import 'package:amazon_clone_app/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  
WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUser(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          title: 'Amazon Clone',
          scaffoldMessengerKey: scaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: GlobalVariables.backgroundColor,
              colorScheme: const ColorScheme.light(
                primary: GlobalVariables.secondaryColor,
              ),
              appBarTheme: const AppBarTheme(
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ))),
          onGenerateRoute: (settings) => generateRoute(settings),
          home: Provider.of<UserProvider>(context).user.token.isNotEmpty
              ?Provider.of<UserProvider>(context).user.type =='user' ? const BottomBar() : const AdminScreen()
              : const AuthScreen(),
        );


}
}