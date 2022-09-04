// ignore_for_file: prefer_const_constructors, unused_local_variable, body_might_complete_normally_nullable, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers, unused_element

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/Feedback_list.dart';
import 'package:group2/Classes/service_provider_methods.dart';
import 'package:group2/common/size.dart';
import 'package:group2/components/image_causerol_con_feed.dart';


import '../globals.dart';

class FeedbackLab extends StatefulWidget {
  const FeedbackLab({Key? key}) : super(key: key);

  @override
  State<FeedbackLab> createState() => _FeedbackLabState();
}

class _FeedbackLabState extends State<FeedbackLab> with TickerProviderStateMixin {
  String feedback = '';

  Future<List<dynamic>?> gettingFeedbacks() async {
    var results = await SPMethods().getFeedback(sp['email']);
    if (results.data['success']) {
      return results.data['feedbacks'];
      // setState(() {
      //   var preActivities = results.data['feedback'];
      // });
    }
    else{
       Fluttertoast.showToast(
          msg: results.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {

    
    TabController _tabController = TabController(length: 2, vsync: this);
    TextEditingController _feedbackController = TextEditingController();
    List<Feedbacks> feedbacks = [
      Feedbacks('He is a good labour', 'Saman', 'worker1.jpg'),
      Feedbacks('He is very Experienced', 'Sudesh', 'worker2.jpg'),
      Feedbacks('He is a clever labour', 'Raveen Wick', 'worker3.jpg'),
      Feedbacks('He is a good labour', 'Heshan Moma', 'worker1.jpg'),
      Feedbacks('He is experienced labour', 'Dinuranga Priyasad', 'worker2.jpg'),
    ];
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
                    appBar: AppBar(
                          backgroundColor: Color(0xFF60A3D9),
                          title: Text(
                            'Feedbacks',
                            style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                          ),
                          leading: IconButton(
                            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          centerTitle: true,
                          bottom: PreferredSize( preferredSize: Size.fromHeight(kPropHeight(context, 0.2)),
                          
                                child: Column(
                                  children:[
                                      // SizedBox(height: 10.0),
                                      Center(
                                        child: CircleAvatar(
                                          // backgroundImage: NetworkImage('${sp['imageUrl']}'),
                                          backgroundImage:sp['imageUrl']!=null? NetworkImage('${sp['imageUrl']}'):AssetImage('assets/imgs/profile.jpg') as ImageProvider,
                                          radius: 40.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          '${sp['username']}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24.0,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 5.0),
                                      Container(
                                        child: const TabBar(
                                                      labelPadding: EdgeInsets.only(left: 30, right: 30),
                                                      
                                                      labelColor: Colors.black87,
                                                      labelStyle: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.bold,
                                                          fontFamily: "Poppins"),
                                                      unselectedLabelColor: Colors.black26,
                                                      isScrollable: true,
                                                      indicatorSize: TabBarIndicatorSize.label,
                                                      tabs: [Tab(text: "View feedbacks"), Tab(text: "Give feedbacks")],
                                                    ),
                                      ),
                                  ]
                                ),
                                
                      ),
                    ),
                    
                    backgroundColor: Colors.white,
          body: TabBarView(
            //tabbarview
            children: [
            
                      Container(
                        //view feedback tab
                        width: kPropWidth(context, 1),
                        height: kPropHeight(context, 1),
                        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                child: FutureBuilder<List<dynamic>?>(
                                        future: gettingFeedbacks(),
                                        builder: (context,AsyncSnapshot<List<dynamic>?> snapshot){
                                          if(snapshot.hasData){
                                            return ImageCauserol_cont_feed(
                                              tags: snapshot.data!,
                                            );
                                          }else{
                                            return CircularProgressIndicator();
                                          }
                                        },
                                      )
                              )
                         
                          ],
                          ),
                        ),
                      ),
                      Container(
                        //add feedback
                                // height: kPropHeight(context, 1),
                                child: Column(
                                  
                                  children: [
                                    // SizedBox(height:10.0),
                                    // Text(
                                    //         'Add Your feedback here',
                                    //         style: TextStyle(
                                    //           fontFamily: 'Poppins',
                                    //           fontSize: 16,
                                    //           fontWeight: FontWeight.bold,
                                    //         ),
                                    //       ),
                                      Container(
                                      child: Card(
                                        color: Colors.grey[50],
                                        elevation: 25.0,
                                        shadowColor: Colors.blueAccent,
                                        margin: EdgeInsets.fromLTRB(20,20,20,0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10,10,10,6),
                                          child: TextField(
                                            onChanged: (value) => feedback = value,
                                            controller: _feedbackController,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 15.0,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Type Here...',
                                              border: InputBorder.none,
                                            ),
                                            keyboardType: TextInputType.text,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ))),
                                      onPressed: () {
                                        var result = SPMethods().addFeedback(
                                            consumer['_id'], sp['email'], feedback);
                              
                                        print(feedback);
                                        _feedbackController.clear();
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text(
                                                'Your feedback added successfully!'),
                                            content: Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                              size: 60,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  
                            
                                  
                                  ],
                                ),
                                        
                                    ),
             
             
            ],
          ),
        ),
      ),
    );
  }
}
