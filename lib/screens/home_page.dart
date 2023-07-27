import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenH = MediaQuery.of(context).size.height ;
    var screenW = MediaQuery.of(context).size.width ;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
        child: Align(
          alignment: Alignment.center,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1  ) ,
             
             children: [
              
              Container(
                child: Row(
                  children: [
                    Container(
                      width: screenW * 0.5 ,
                      // color: Colors.black,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/man.png"))
                      ),
                    ) ,
                    Container(
                      width: screenW * 0.5 ,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/man.png"))
                      ),
                      // color: Colors.green,
                    ),
                  ],
                ),
              ) ,
               
              Container(
                child: Row(
                  children: [
                    Container(
                      width: screenW * 0.5 ,
                      // color: Colors.yellow,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/man.png"))
                      ),
                    ) ,
                     
                    Container(
                      width: screenW * 0.5 ,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/man.png") ,
                        fit: BoxFit.cover)
                      ),
                      // color: Colors.red,
                    ),
                  ],
                ),
              ) ,
              
               
                
             ],
             ),
        ),
           
      ),
    );
  }
}
