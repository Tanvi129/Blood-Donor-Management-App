import 'package:flutter/material.dart';

class ProfileDisplayData extends StatelessWidget {
   ProfileDisplayData({ Key? key , required this.icon , required this.tag , required this.tagValue}) : super(key: key);

  IconData icon;
  String tag;
  String tagValue;


  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon, size: 40, color: Colors.white,),
                const SizedBox(
                  width: 8,
                ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tag,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      Text(tagValue ,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                      ),
                      
                    ],
                  )
                ],
              );
  }
}