import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group2/pages/edit_csprofile.dart';
import 'package:image_picker/image_picker.dart';
import '../Classes/userprofiles_getdatamethods.dart';
import 'changepw.dart';



class Customerpview extends StatefulWidget {
  const Customerpview({Key? key}) : super(key: key);

  @override
  State<Customerpview> createState() => _CustomerpviewState();
}

class _CustomerpviewState extends State<Customerpview> {

  String url = 'http://10.0.2.2:5000';

  Future<Map<String, dynamic>?> getData ()async {
    try{
      print('1');
      var result = await GetUsersData().getUserInfo('$url/getConsumerInfo');
      print(result);
      return result;
    }
    catch(err){
        print(err.toString());
        return {};
    }
  }

  File? image;
  Future pickImage(ImageSource source) async{
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    }on PlatformException catch(e){
      print('Failed to pick image:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(hexColor('#F0F0F0')),
        body: SingleChildScrollView(
          child: FutureBuilder<Map<String, dynamic>?>(
            future: getData(),
            builder: (context, AsyncSnapshot<Map<String, dynamic>?> snapshot){
              if(snapshot.hasData){
                if(snapshot.data!.isNotEmpty){
                    return Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          PopupMenuButton<int>(
                            icon: const Icon(Icons.menu, color: Colors.black),
                            itemBuilder: (context) => [
                              const PopupMenuItem<int>(
                                  value: 0, child: Text('Edit Profile')
                              ),
                              const PopupMenuItem<int>(
                                  value: 1, child: Text('Change password')
                              )
                            ],
                            onSelected: (item) => onSelete(item, snapshot.data),
                          )
                        ],
                      ),
                      Stack(
                        children: [

                          Container(
                            margin: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(hexColor('#FEFEFE')),
                                borderRadius:
                                const BorderRadius.all(Radius.circular(42.0))),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 70.0,
                                ),
                                Center(
                                  child: Text(
                                    '${snapshot.data!['username']}',
                                    style: const TextStyle(
                                        fontSize: 30.0, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                    margin:
                                    const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 40.0),
                                    padding:
                                    const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(14.0)),
                                      color: Colors.grey[100],
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.email_rounded),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Text('${snapshot.data!['email']}',
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                )),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20.0,
                                        ),


                                        Row(
                                          children:  [
                                            const Icon(Icons.location_on,
                                              color: Colors.red,),
                                            const SizedBox(
                                              width: 5.0,
                                            ),


                                            Text(
                                              '${snapshot.data!['hometown']}',
                                              style: const TextStyle(
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.home_filled),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Text(
                                              '${snapshot.data!['address']}',
                                              style: const TextStyle(
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20.0,
                                        ),

                                        Row(
                                          children: [
                                            const Icon(Icons.phone_in_talk,
                                              color: Colors.green,),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Text('${snapshot.data!['contactNo']}',
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                )),
                                          ],
                                        ),
                                        const SizedBox(
                                              height: 20.0,
                                            ),
                                            Row(children: [
                                              const Icon(Icons.home),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              Text('${snapshot.data!['hometown']}',
                                                  style: const TextStyle(
                                                    fontSize: 20.0,
                                                  )),
                                            ]),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),

                          Positioned(
                              child: Center(
                                child: Stack(
                                  children: [
                                    SizedBox(
                                    height: 107.0,
                                    width: 115.0,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(16.0),
                                          child: Image.network(
                                            '${snapshot.data!['imageUrl']}',
                                            fit: BoxFit.cover,
                                          )
                                      ),
                                    ),
                                    Positioned(
                                        bottom: -5.0,
                                        right: -5.0,
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.add_a_photo_outlined,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (context){
                                                return Container(
                                                  height: 100.0,
                                                  width: MediaQuery.of(context).size.width,
                                                  margin: const EdgeInsets.symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 20.0
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      const Text('Choose profile photo'),
                                                      const SizedBox(height: 10.0,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                primary: Color(hexColor('#1982BD')),
                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(16.0))
                                                            ),
                                                            onPressed: () {
                                                              pickImage(ImageSource.gallery);
                                                            },
                                                            child: const Text('Add from galery',style:TextStyle(color: Colors.white),),

                                                          ),

                                                          const SizedBox(
                                                            width: 10.0,
                                                          ),
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                primary: Color(hexColor('#1982BD')),
                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(16.0))
                                                            ),
                                                            onPressed: () {
                                                              pickImage(ImageSource.camera);
                                                            },
                                                            child: const Text('Add from Camera',style:TextStyle(color: Colors.white),),

                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        )
                                    )
                                  ]
                                ),
                              ))
                        ],
                      ),
                    ]);
                }else{
                  return Text('No data');
                }
              }
              else if(snapshot.hasError){
                return Text('A Error');
              }
              else {
                return CircularProgressIndicator();
              }
          },

          ),
        ),
      ),
    );
  }

  void onSelete( int item, Map<String ,dynamic>? data) async{
    switch (item) {
      case 0:
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => Editcsprofile(data!)),
        );
        setState(() {

        });
        break;
      case 1:
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => Change_pw()),
        );
        break;
    }
  }


}


hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
