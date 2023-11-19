/**
 * MAIN
 * ========
 *! 1.make void main future
 * -----------------
 *  void main() async{
 **   WidgetsFlutterBinding.ensureInitialized();
 *             WidgetFlutterBinding is used to interact with the Flutter engine. 
 *            Firebase.initializeApp() needs to call native code to initialize 
 *            Firebase, and since the plugin needs to use platform channels to call 
 *            the native code, which is done asynchronously therefore you have to call 
 *            ensureInitialized() to make sure that you have an instance of the WidgetsBinding
 ** await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ); 
 *! 2.runApp
  ------
   runApp(AmazonClone()); 
 *  }
 * !3.stateless widget:AmazonClone
 * ------------------------
 *   class AmazonClone extends StatelessWidget {
     const AmazonClone({super.key});

 * !4.wrap material app with Multiprovider:use UserDetailsProvider
 * -------------------------
 *  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider<UserDetailsProvider>(
          create: (_) => UserDetailsProvider()
        )
      ]
    )
 * !5.Extend MaterialApp as its child:title,theme,debugshowcheckedmodebanner,home
 * ----------------------------------
 * child:MaterialApp(
 *  title:"Amazon Clone"
 * theme:themeData.light().copyWith(scaffoldBackGroundColor: backgroundColor)
 * 
 * !6.Wrap home: inside Stream Builder:stream,builder
 * -----------------------------------
 *  home:StremBuilder(
 *  *stream Builder:StreamBuilder is a widget that builds itself based on the latest snapshot of interaction with a stream.
 *   *stream builder constantly listens to the changes(data that chnages,Strems) 
 *    *that happen in the stream that attached(database,cloud) and rebuilds what changed
 *  strem:FirebaseAuth.instance.authStateChanges(),
 *  builder:(context,AsyncSnapshot<User?> user)
 * {
 *   if(user.conneectionState==Connectionstate.waiting)
 *    {
 *     return Center(child:CircularProgressIndicator);
 *    }
 *   else if(user.hasData)
 *    {
 *     return ScreenLayout();
 *    }
 *  else
 *    {
 *     return SignInScreen();
 *    }
 * }
 * )
 * 
 * )
 * 
 * 
 * 
 * 
 * 
 * 
 * 




 * 
 * 


 */