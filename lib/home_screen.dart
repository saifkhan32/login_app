import 'package:assignment/common/widgets/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
                  appBar: AppBar(
                    backgroundColor: const Color.fromRGBO(49, 39, 79, 1),
                title : Text('Home',style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600) ,)),
                centerTitle: true,
                   leading: IconButton(onPressed: (){
          context.pop(); 
        }, 
        icon: const Icon(
          LineAwesomeIcons.angle_left_solid,color: Colors.black,)),
                actions: [
                  IconButton( icon: Icon(
                    FontAwesomeIcons.circleUser,
                    color: Colors.pink[200],),
                    onPressed: ()=> context.pushNamed('profile_screen'))
                ],
    ),
    body : GridDashboard());
  }
}