/**
 * SCREEN LAYOUT 
 * ==============
 * !1.create a StatefullWidget
 *  -overiide
 *    initState(),dispose()
 * !2.create an object of PageController(below extends class)
 *   -this is to give inside controller of PageView
 *   -dispose it inside the dispose()
 * !3.create a variable currentPage=0
 *   -this is to use inside changePage()
 * !4.create a function changePage()
 *  -this functn is to change index of pages when we click bottom bar
 *  -the function is called on the ontap of TabBar
 *  -but inside it we call a function inside pageView
 *  -thus it get activated
 *  -for this we use PageController object we created
 *  *pageController.jumpToPage()
 *  -we use currentPage variable
 *  -we use setState() to set the currentpage=page(from jumptopage)
 *         void  chnagePage( int page)
 *          {
 *           pageController.jumptoPage(page);
 *            setstate((){
 *                      currentPage=page;})
 *             }
 * !5.dispose pageController inside dispose
 *   @override
 *        void dispose()
 *                  {super.dispose();pageController.dispose();}
 * !6.CloudFireStore user data
 *   -initailize it in the starting point of our application to fetch data
 *   -inside initState()
 *   @override
 *    void initState(){
 *          super.initState();
 *           CloudFirestoreClass.getNameAndAddress();}
 * !7.PROVIDER:we nave to activate user provider here
 *  -inside Wideget Build
 *    Provider.of<UserDetailsProvider>((context,listen=true)).getData();
 * !8.UI
 **       DefaultTabController(
 *        length:4
 *        child: 
 *             *SafeArea(
 *              child:
 *                   *Scaffold(
 *                         body:PageView(controller:pageController,children:screens)
 *                         bottomNavigationBar:
 *                                       *Container(
 *                                                  child:
 *                                                    *TabBar(
 *                                                              ontap:changePage
 *                                                               tabs:[
 *                                                                           *Tab(child:Icon())
 *                                                                           Tab(child:Icon())
 *                                                                           Tab(child:Icon())
 *                                                                           Tab(child:Icon())
 * ]//give 4
 *                                                              indicatorSize:
 *                                                              indicator:
 * )
 *    )
 *             ))
 * )      
 * 
 * 
 */