import 'package:amazon_clone/firebase_options.dart';
import 'package:amazon_clone/layout/screen_layout.dart';
import 'package:amazon_clone/providers/user_details_provider.dart';
import 'package:amazon_clone/screens/sell_screen.dart';
import 'package:amazon_clone/screens/sign_in_screen.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserDetailsProvider>(
            create: (_) => UserDetailsProvider())
      ],
      child: MaterialApp(
        title: "Amazon Clone",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: backgroundColor),
        //stream builder constantly listens to the changes(data that chnages,Strems) that happen in the screen and rebuilds what in the
        //so here every time the user log in nad out the widget is gonna rebuild
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot<User?> user) {
              if (user.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              } else if (user.hasData) {
                // return const ScreenLayout();
                // print("uid:${FirebaseAuth.instance.currentUser!.uid}");
                // return ElevatedButton(
                //     onPressed: () {
                //       FirebaseAuth.instance.signOut();
                //     },
                //     child: Text("Sign out"));
                //return const Text("Signed In");
                return const ScreenLayout();
              } else {
                return const SignInScreen();
              }
            }),
      ),
    );
  }
}
