import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group2/Classes/Feedback_list.dart';

class FeedbackV extends StatefulWidget {
  const FeedbackV({Key? key}) : super(key: key);

  @override
  _FeedbackVState createState() => _FeedbackVState();
}

class _FeedbackVState extends State<FeedbackV> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    TextEditingController _feedbackController = TextEditingController();
    List<Feedbacks> feedbacks = [
      Feedbacks('He is a good labour', 'Saman', 'worker1.jpg'),
      Feedbacks('He is very Experienced', 'Sudesh', 'worker2.jpg'),
      Feedbacks('He is a clever labour', 'Raveen Wick', 'worker3.jpg'),
      Feedbacks('He is a good labour', 'Heshan Moma', 'worker1.jpg'),
      Feedbacks(
          'He is experienced labour', 'Dinuranga Priyasad', 'worker2.jpg'),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10.0),
              Container(
                height: 30.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 5.0),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios_rounded),
                      color: Colors.blueAccent,
                      splashColor: Colors.lightBlueAccent,
                    ),
                  ],
                ),
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/imgs/pro1.jpg'),
                  radius: 40.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'W.Krishan Perera',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 45, right: 40),
                    controller: _tabController,
                    labelColor: Colors.black,
                    indicatorWeight: 4,
                    indicatorColor: Color(0xFF125488),
                    labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "poppins"),
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(text: "View Feedbacks"),
                      Tab(text: "Give Feedbacks")
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 380,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        height: 300,
                        width: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: feedbacks.length,
                          itemBuilder: (context, index) {
                            return Card(
                              // color: Colors.cyanAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 10.0,
                              shadowColor: Colors.blueAccent,
                              margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    child: Image.asset(
                                        'assets/imgs/${feedbacks[index].profile}'),
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        feedbacks[index].feedback,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      SizedBox(height: 4.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            feedbacks[index].cName,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11.0,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              'Add Your feedback here',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Card(
                            color: Colors.grey[50],
                            elevation: 25.0,
                            shadowColor: Colors.blueAccent,
                            margin: EdgeInsets.all(20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
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
                                maxLines: 9,
                              ),
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ))),
                              onPressed: () {
                                print(_feedbackController.text);
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
