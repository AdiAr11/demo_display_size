import 'package:demo_display_size/main.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    print('Width: ${size.width}');
    print('Height: ${size.height}');

    return Scaffold(
      backgroundColor: size.width < 600 ? Colors.purple : Colors.green,
      appBar: AppBar(
        title: const Text('Responsive App Demo'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(size.width > 650)
              Container(
                width: size.width/5,
                height: size.height/3,
                color: Colors.red,
              ),
              Container(
                width: size.width/5,
                height: size.width/3,
                color: Colors.blue,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  width: 0.5625*size.height,
                  height: size.height / 4,
                  color: Colors.deepOrange,
                ),
              ),
              // Container(
              //   width: display!.size.width/5,
              //   height: display!.size.width/3,
              //   color: Colors.purple,
              // ),
            ],
          ),
          Text(size.width.toString())
        ],
      ),
    );
  }
}