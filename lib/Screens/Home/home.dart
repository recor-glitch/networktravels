import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Screens/Components/custom_drawer.dart';
import 'package:networktravels/Screens/Home/components/bus_search.dart';
import 'package:networktravels/Screens/Home/components/custom_container.dart';
import 'package:networktravels/Screens/Components/customappbar.dart';
import 'package:networktravels/Screens/Home/components/custombottom.dart';
import 'package:networktravels/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _controller, tripcontroller;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    tripcontroller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: CustomDrawer(scaffoldkey: scaffoldkey),
      backgroundColor: yellow,
      body: SafeArea(
          child: Stack(children: [
        Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
        Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 29),
                          child: Text('Where are you \ngoing to?',
                              style: GoogleFonts.montserrat(
                                  fontSize: 32, fontWeight: FontWeight.bold))),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              child: Container(
                                  height: 2,
                                  color: blacky,
                                  width: MediaQuery.of(context).size.width),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 29),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: yellow),
                              child: TabBar(
                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  labelColor: blacky,
                                  labelStyle: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  controller: tripcontroller,
                                  tabs: [
                                    Tab(text: 'One way'),
                                    Tab(text: 'Round trip')
                                  ]),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: BusSearch()),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 29),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Row(
                            children: [
                              Expanded(
                                  child: CustomContainer(
                                      title: 'Brand \nnew buses',
                                      subtitle: 'New launches, Upcoming.',
                                      bgimg: 'assets/note.png')),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02),
                              Expanded(
                                  child: CustomContainer(
                                      title: 'COVID-19 \nTravel guidelines',
                                      subtitle:
                                          'Check the latest travel guidelines issued by state government.',
                                      bgimg: 'assets/sbus.png'))
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            )),
        Positioned(
            top: 0,
            child: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
                child: CustomAppBar(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () {
                            scaffoldkey.currentState!.openDrawer();
                          },
                          child: Icon(Icons.menu)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Image(image: AssetImage('assets/logo.png')),
                        ),
                      ),
                      Icon(Icons.notifications)
                    ],
                  ),
                )))),
        Positioned(
            bottom: 13,
            left: 11,
            right: 11,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomBottom(
                  child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      controller: _controller,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      tabs: [
                    Tab(icon: Icon(Icons.home)),
                    Tab(icon: Icon(Icons.business)),
                    Tab(icon: Icon(Icons.support)),
                    Tab(icon: Icon(Icons.person))
                  ])),
            ))
      ])),
    );
  }
}
