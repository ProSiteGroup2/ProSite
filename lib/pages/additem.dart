import 'package:flutter/material.dart';
import 'package:group2/pages/edit_hdprofile.dart';

class Additem extends StatefulWidget {
  const Additem({Key? key}) : super(key: key);

  @override
  State<Additem> createState() => _AdditemState();
}

class _AdditemState extends State<Additem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Edithdprofile()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          color: Colors.blueAccent,
        ),
        elevation: 0.0,
        backgroundColor: Color(hexColor('#F0F0F0')),
      ),
      backgroundColor: Color(hexColor('#F0F0F0')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
              child: Text(
                'Fill the details..',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
              child: Text(
                'Title:',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                color: Colors.blueGrey[50],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 5.0,
                    offset: Offset(7.0, 7.0),
                  )
                ],
              ),
              child: const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                  child: TextField(
                    cursorColor: Colors.black12,
                  )),
            ),
            const SizedBox(height: 15.0),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
              child: Text(
                'Description:',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                color: Colors.blueGrey[50],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 5.0,
                    offset: Offset(7.0, 7.0),
                  )
                ],
              ),
              child: const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                  child: TextField(
                    cursorColor: Colors.black12,
                  )),
            ),
            const SizedBox(height: 15.0),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
              child: Text(
                'Price(Rs):',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                color: Colors.blueGrey[50],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 5.0,
                    offset: Offset(7.0, 7.0),
                  )
                ],
              ),
              child: const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                  child: TextField(
                    cursorColor: Colors.black12,
                  )),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
              child: Text(
                'Add Photos Max(5)',
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(hexColor('#1982BD')),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadiusDirectional.circular(16.0))),
                  onPressed: () {},
                  child: const Text(
                    'Use Default',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Container(
                  height: 100.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    color: Colors.lightBlue[100],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
              child: Text(
                'Contact details',
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
              child: Text(
                'Name:',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                color: Colors.blueGrey[50],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 5.0,
                    offset: Offset(7.0, 7.0),
                  )
                ],
              ),
              child: const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                  child: TextField(
                    cursorColor: Colors.black12,
                  )),
            ),
            const SizedBox(height: 15.0),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
              child: Text(
                'Phone number:',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                color: Colors.blueGrey[50],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 5.0,
                    offset: Offset(7.0, 7.0),
                  )
                ],
              ),
              child: const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                  child: TextField(
                    cursorColor: Colors.black12,
                  )),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(hexColor('#1982BD')),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(16.0))),
                onPressed: () {},
                child: const Text(
                  'Post Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
