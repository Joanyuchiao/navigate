import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Page1(),
    ),
  );
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          child: const Text('Go!'),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
const items=<String>['第1項','第2項','第3項','第4項','第5項','第6項','第7項','第8項'];
const icons=<String>['Icons.accessible ','Icons.abc_sharp','Icons.access_alarms_sharp ','Icons.accessibility_sharp','Icons.account_balance_sharp ','Icons.account_circle_rounded ','Icons.add_a_photo_outlined ','Icons.add_circle_outline_outlined'];
class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(


        child: ListView.separated(

          itemCount: items.length,
          itemBuilder: (content,index) =>

              Card(
                child:ListTile(title:Text(items[index]),
                  onTap:(){},
                  leading:Container(
                    child: CircleAvatar(backgroundImage: AssetImage(icons[index],),),

                  ),
                  subtitle:Text(items[index]+'項目說明',style:TextStyle(fontSize: 16),),),
              ),
          separatorBuilder: (content,index) => const Divider(),
        ),
      ),





    );
  }
}