import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileMenuWidget extends StatelessWidget {


  const ProfileMenuWidget({super.key,
  required this.onPress, required this.title, required this.icon, this.endIcon = true});
  
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blue.withOpacity(0.1),
        ),
        child: Icon(icon, color: const Color.fromARGB(255, 33, 149, 243)),
      ),
      title: title == "Logout" ? Text(title, style: Theme.of(context).textTheme.bodyLarge?.apply(color: Colors.red)) : Text(title, style: Theme.of(context).textTheme.bodyLarge?.apply(color: Colors.black)) ,
      trailing: endIcon? Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: const Icon(LineAwesomeIcons.angle_right_solid, size: 18.0, color: Colors.grey)) : null,
    );
  }
}
