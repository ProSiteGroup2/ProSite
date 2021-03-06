import 'package:flutter/material.dart';
import 'package:group2/Classes/labour_schedule.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group2/Classes/my_flutter_app_icons.dart';
import 'package:url_launcher/url_launcher.dart';



class LActivity extends StatefulWidget {
  const LActivity({Key? key}) : super(key: key);

  @override
  _LActivityState createState() => _LActivityState();
}

class _LActivityState extends State<LActivity> {
  @override
  Widget build(BuildContext context) {
    List<LSchedule> l_schedule=[
      LSchedule('Saman Kumara', '2022-05-06', '1.00 pm','worker1.jpg'),
      LSchedule('Kiri Saman', '2022-05-11', '10.00 am','worker2.jpg'),
      LSchedule('Lahiru Kumara', '2022-05-06', '4.00 pm','worker3.jpg'),
    ];
    List<LSchedule> l_preActivity=[
      LSchedule('Saman Kumara', '2022-05-06', '1.00 pm','worker1.jpg'),
      LSchedule('Kiri Saman', '2022-05-11', '10.00 am','worker2.jpg'),
      LSchedule('Lahiru Kumara', '2022-05-06', '4.00 pm','worker3.jpg'),
    ];
    List<int> ratings=[4,4,4,3,5,3];
    int sum_rating=0;
    for (var i = 0;i<ratings.length;i++){
      sum_rating +=ratings[i];
    }
    var avg_rating= (sum_rating/ratings.length);
    avg_rating=double.parse(avg_rating.toStringAsFixed(2));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,20.0,0,0),
                  child: Text(
                    'Activities',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize:25.0,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.cyanAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 14.0,
                shadowColor: Color(0x802196F3),
                margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0,10.0),
                child:Row(
                      children: <Widget>[
                        Expanded(
                          flex:2,
                          child: Column(
                            children: [
                              Text(
                                'Rashan Fernando',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Rating: $avg_rating / 5 ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0,8.0,16.0,10.0),
                            child: Container(
                                height: 75,
                                width: 75,
                                child: Image.asset('assets/imgs/pro1.jpg')),
                          ),),
                      ],
                    ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,5.0,0,5.0),
                child: Text(
                  'Upcoming Schedule',
                      style:TextStyle(
                        fontFamily: 'Poppins',
                        fontSize:20.0,
                        fontWeight: FontWeight.bold,
                        color:Colors.black54,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0,0,0,0),
                child: Container(
                  decoration: BoxDecoration(
                    border:Border.all(color: Colors.white,width: 1),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  height: 250,
                  width: 400,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: l_schedule.length,
                    itemBuilder: (context,index){
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 10.0,
                        shadowColor: Colors.blueAccent,
                        margin: EdgeInsets.fromLTRB(10.0, 0,10.0,10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(

                            leading: Container(
                              height:50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/imgs/${l_schedule[index].profile}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title:Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex:4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          l_schedule[index].cName,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              l_schedule[index].date,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.black54,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5,),
                                          Expanded(
                                              child:Text(
                                                l_schedule[index].time,
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12.0,
                                                  color: Colors.black54,
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  flex:1,
                                  child: IconButton(
                                    splashColor: Colors.lightBlueAccent,
                                    icon: Icon(
                                        Icons.add_call
                                    ),
                                    onPressed: (){},
                                    color: Colors.black,
                                  ),),
                                Expanded(
                                  flex:1,
                                  child: IconButton(
                                    splashColor: Colors.lightGreen,
                                    icon: Icon(
                                      MyFlutterApp.whatsapp
                                    ),
                                    onPressed: (){},

                                    color: Colors.green,
                                  ),)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,5.0,0,5.0),
                child: Text(
                  'Past Activities',
                  style:TextStyle(
                    fontFamily: 'Poppins',
                    fontSize:20.0,
                    fontWeight: FontWeight.bold,
                    color:Colors.black54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0,0,0,0),
                child: Container(
                  decoration: BoxDecoration(
                    border:Border.all(color: Colors.white,width: 1),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  height: 250,
                  width: 400,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: l_preActivity.length,
                    itemBuilder: (context,index){
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 10.0,
                        shadowColor: Colors.blueAccent,
                        margin: EdgeInsets.fromLTRB(10.0, 0,10.0,10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(

                            leading: Container(
                              height:50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/imgs/${l_preActivity[index].profile}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title:Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex:4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        l_preActivity[index].cName,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              l_preActivity[index].date,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.black54,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5,),
                                          Expanded(
                                              child:Text(
                                                l_preActivity[index].time,
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12.0,
                                                  color: Colors.black54,
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  flex:1,
                                  child: IconButton(
                                    splashColor: Colors.lightBlueAccent,
                                    icon: Icon(
                                      Icons.add_call
                                    ),
                                    onPressed: (){
                                      launch("tel://+94787145867");
                                    },
                                    color: Colors.black,
                                  ),),

                                Expanded(
                                  flex:1,
                                  child: IconButton(
                                    splashColor: Colors.lightGreen,
                                    icon: Icon(
                                        MyFlutterApp.whatsapp,
                                    ),
                                    onPressed: (){
                                      launchwhatsapp( number:"tel://+94787145867",message: "hello");
                                    },
                                    color: Colors.green,
                                  ),)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void launchwhatsapp({@required number,@required message}) async{
    String url="whatsapp://send?phone=$number&text=$message";
    await canLaunch(url)?launch(url):print("cant't open whatsapp ");

  }
}
