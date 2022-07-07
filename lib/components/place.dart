

import 'package:flutter/material.dart';
import 'package:group2/common/color.dart';
import 'package:group2/common/constraints.dart';
import 'package:group2/common/size.dart';
import 'package:group2/common/style.dart';

import '../../components/image_causerol.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({Key? key}) : super(key: key);

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  /*
   *  Common
   */

  BoxDecoration mainFeatureBoxDecoration = BoxDecoration(
    border: Border.all(color: kGrayColor.withOpacity(0.5), width: 0.5),
    borderRadius: BorderRadius.circular(8.0),
  );

  TextStyle mainFeatureTopicTextStyle = const TextStyle(
    fontSize: 12,
    fontFamily: kFontFamily,
    color: kGrayColor,
  );

  TextStyle mainFeatureValueTextStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: kFontFamily,
      color: kBlackColor);

  TextStyle mainFeatureOtherTextStyle = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: kFontFamily,
    color: kGrayColor,
  );

  ///
  ///

  /*
   * Sample Data 
   */

  Map<String, dynamic> data = {
    "isRegisted": true,
    "for": "Boys",
    'fee': {'per': 'Month', 'cost': 4000},
    'location': {
      'address': "15/1 , ABC Rd, ABC, 11850",
      'lat': 7.526525,
      'lng': 8.265977
    },
    'available': 5,
    'about':
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo velit, iaculis ac diam et, condimentum molestie felis. Curabitur maximus turpis ut vehicula aliquet. Proin vitae eleifend metus Nullam justo velit, iaculis ac diam et, condimentum molestie felis. Curabitur maximus turpis ut vehicula aliquet. Proin vitae eleifend metus",
    'imgs': [
      'assets/imgs/logo.png'
      'assets/imgs/cement.jpg'
      'assets/imgs/cement.png',
      'assets/img/house02.png'
    ],
    'owner': {
      'name': "Rental Surat",
      'who': "Owner",
      'image': "assets/img/ava_2.png",
      'contact_no': "+94750001112"
    },
    'rating': {
      'overall': 4.5,
      'outof': 5,
      'reviews': [
        {
          'avatar': 'assets/img/ava_2.png',
          'user_name': 'ACV IOP',
          'rate': 4.5,
          'review':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo velit, iaculis ac diam et, condimentum molestie felis. Curabitur maximus turpis ut vehicula aliquet. Proin vitae eleifend metus Nullam justo velit, iaculis ac diam et, condimentum molestie felis. Curabitur maximus turpis ut vehicula aliquet. Proin vitae eleifend metus',
        },
        {
          'avatar': 'assets/img/ava_2.png',
          'user_name': 'IOP IOP',
          'rate': 4.6,
          'review': 'Lorem ipsum ',
        },
      ],
    },
    'facilities': [
      {
        'category': 1,
        'type': "Table",
        'amount': 3,
        'description': "",
        'price': 0,
      },
      {
        'category': 2,
        'type': "Hot Shower",
        'amount': 3,
        'description': "",
        'price': 0,
      },
      {
        'category': 3,
        'type': "Breakfest",
        'amount': 3,
        'description': "with 03 curies",
        'price': 120,
      },
      {
        'category': 3,
        'type': "Lunch",
        'amount': 3,
        'description': "with 04 curies",
        'price': 120,
      },
      {
        'category': 4,
        'type': "Breakfest",
        'amount': 3,
        'description':
            "with 03 curieswith 03 curieswith 03 curieswith 03 curieswith 03 curieswith 03 curieswith 03 curies",
        'price': 120,
      }
    ],
    'user': {
      'id': "u1256369554",
      'name': 'USER UIO',
      'image': 'assets/img/ava_2.png'
    }
  };

  var kSpace = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appbar
        appBar: AppBar(
            backgroundColor: kWhiteColor,
            elevation: 1,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kBlackColor,
              ),
              onPressed: () {},
            ),
            centerTitle: true,
            titleTextStyle: kTitleTextStyle,
            title: const Text(
              "Search Result",
            )),

        //body
        body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
            padding: kH_16,
            child: Column(
              children: [
                /**
                 * 
                 * IMAGE CAUSEROL
                 * 
                 */

                ImageCauserol(
                  context: context,
                  tags: data['tags'],
                ),

                const SizedBox(height: 12.0),

                /**
                 * 
                 * OWNER DETAILS
                 * 
                 */

                OwnerDetails(
                  details: data['owner'],
                ),

                const SizedBox(height: 12.0),

                /**
                 * 
                 *  MAIN FEATURES
                 * 
                 */

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    /**
                     *  For 
                     */
                    Container(
                      padding: kA_16,
                      width: kPropWidth(context, 0.45),
                      height: 100,
                      alignment: Alignment.topCenter,
                      decoration: mainFeatureBoxDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "For",
                                style: mainFeatureTopicTextStyle,
                              ),
                              const Icon(
                                Icons.person_outline,
                                color: kGrayColor,
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${data['for']}",
                                style: mainFeatureValueTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: kSpace,
                    ),

                    /**
                     *  Fee
                     */
                    Container(
                      padding: kA_16,
                      width: kPropWidth(context, 0.45),
                      height: 100,
                      decoration: mainFeatureBoxDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Fee",
                                style: mainFeatureTopicTextStyle,
                              ),
                              const Icon(
                                Icons.money_outlined,
                                color: kGrayColor,
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${data['fee']['cost']}",
                                style: mainFeatureValueTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "per ${data['fee']['per']}",
                                style: mainFeatureOtherTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: kSpace,
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    /**
                     *  Address
                     */
                    Container(
                      padding: kA_16,
                      width: kPropWidth(context, 0.45),
                      height: 204,
                      decoration: mainFeatureBoxDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Location",
                                style: mainFeatureTopicTextStyle,
                              ),
                              const Icon(
                                Icons.location_pin,
                                color: kGrayColor,
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: kPropWidth(context, 0.4) - 32.0,
                                child: Text(
                                  "${data['location']['address']}",
                                  style: mainFeatureValueTextStyle,
                                  maxLines: 2,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: kA_16,
                                  child: ElevatedButton(
                                    style: kMutableButtonStyle(context, 10, 36),
                                    onPressed: () {
                                      /**
                                       *  
                                       *  Open Google map
                                       * 
                                       * 
                                       */
                                    },
                                    child: const Text(
                                      "View On Map",
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: kSpace),
                    Column(
                      children: [
                        /**
                         *  Available
                         */
                        Container(
                          padding: kA_16,
                          width: kPropWidth(context, 0.45),
                          height: 100,
                          decoration: mainFeatureBoxDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Avaliable",
                                      style: mainFeatureTopicTextStyle),
                                  const Icon(
                                    Icons.people_outline,
                                    color: kGrayColor,
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${data['available']}",
                                    style: mainFeatureValueTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: kSpace,
                        ),

                        /**
                         *  Rating
                         */

                        Container(
                          padding: kA_16,
                          width: kPropWidth(context, 0.45),
                          height: 100,
                          decoration: mainFeatureBoxDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Rating",
                                    style: mainFeatureTopicTextStyle,
                                  ),
                                  const Icon(
                                    Icons.reviews_outlined,
                                    color: kGrayColor,
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data['rating']['overall']}",
                                    style: mainFeatureValueTextStyle,
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    "(${data['rating']['outof']})",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: kFontFamily,
                                        color: kBlackColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 12.0,
                ),

                /**
                 * 
                 *  MORE ABOUT
                 * 
                 */

                //topic
                Container(
                  margin: kV_16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text(
                        "More About",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            fontFamily: kFontFamily,
                            color: kBlackColor),
                      ),
                    ],
                  ),
                ),

                // desc
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: kPropWidth(context, 1) - 32.0,
                      child: Text(
                        "${data['about']}",
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            fontFamily: kFontFamily,
                            color: kGrayColor),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12.0),

                /**
                 *  FACILITIES 
                 */

                facilitiesView(context, data['facilities']),

                /**
                 * 
                 *  REVIEWS
                 * 
                 */

                Container(
                  margin: kV_16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        "Reviews",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            fontFamily: kFontFamily,
                            color: kBlackColor),
                      ),
                      data['isRegisted']
                          ? Container(
                              padding: kA_16,
                              child: ElevatedButton(
                                style: kMutableButtonStyle(context, 10, 36),
                                onPressed: () {
                                  print("v");
                                },
                                child: const Text(
                                  "Write Review",
                                ),
                              ))
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(
                  width: kPropWidth(context, 1) - 32,
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data['rating']['reviews'].length,
                      itemBuilder: (context, index) {
                        return ReviewCard(
                          review: data['rating']['reviews'][index],
                        );
                      }),

                  //image count view
                ),

                const SizedBox(
                  height: 12.0,
                ),

                // Request Button
                Container(
                    margin: kV_8,
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: loginButtonStyle(context),
                      onPressed: () {
                        // login button
                      },
                      child: const Text(
                        "Request",
                        style: kButtonTextStyle,
                      ),
                    )),
              ],
            ),
          )),
        ));
  }

  Widget facilitiesView(BuildContext context, dynamic facilities) {
    return Column(
      children: [
        // topic
        Container(
          margin: kV_16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: const [
              Text(
                "Facilities",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: kFontFamily,
                    color: kBlackColor),
              ),
            ],
          ),
        ),

        // facilities
        SizedBox(
          width: kPropWidth(context, 1) - 32,
          height: kPropHeight(context, 0.4),
          child: GridView.builder(
            itemCount: facilities.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 4 / 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                maxCrossAxisExtent: 258,
                mainAxisExtent: 100),
            itemBuilder: (context, index) {
              switch (facilities[index]['category']) {
                case 1:
                  return HouseholdFacilityCard(data: facilities[index]);
                case 2:
                  return WashroomFacilityCard(data: facilities[index]);
                case 3:
                  return FoodFacilityCard(data: facilities[index]);
                default:
                  return OtherFacilityCard(data: facilities[index]);
              }
            },
          ),
        ),
      ],
    );
  }
}

/*
 * 
 * 
 */

class HouseholdFacilityCard extends StatelessWidget {
  Map<String, dynamic> data;

  HouseholdFacilityCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kA_16,
      width: kPropWidth(context, 0.45),
      height: 100,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor, width: 1.6),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                Icons.roofing_outlined,
                color: kGrayColor,
                size: 14.0,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Household",
                style: TextStyle(
                    fontSize: 10, fontFamily: kFontFamily, color: kGrayColor),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${data['type']}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: kFontFamily,
                    color: kBlackColor),
              ),
              Text(
                "${data['amount']}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: kFontFamily,
                    color: kBlackColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WashroomFacilityCard extends StatelessWidget {
  Map<String, dynamic> data;
  WashroomFacilityCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kA_16,
      width: kPropWidth(context, 0.45),
      height: 100,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: Border.all(color: kOrangeColor, width: 1.6),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                Icons.bathtub_outlined,
                color: kGrayColor,
                size: 14.0,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Washroom",
                style: TextStyle(
                    fontSize: 10, fontFamily: kFontFamily, color: kGrayColor),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${data['type']}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: kFontFamily,
                    color: kBlackColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FoodFacilityCard extends StatelessWidget {
  Map<String, dynamic> data;
  FoodFacilityCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kA_16,
      width: kPropWidth(context, 0.45),
      height: 100,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: Border.all(color: kGreenColor, width: 1.6),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                Icons.fastfood_outlined,
                color: kGrayColor,
                size: 14.0,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Food",
                style: TextStyle(
                    fontSize: 10, fontFamily: kFontFamily, color: kGrayColor),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${data['type']}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: kFontFamily,
                    color: kBlackColor),
              ),
              Text(
                "LKR ${data['price']}",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: kFontFamily,
                    color: kBlackColor),
              ),
            ],
          ),
          SizedBox(
            width: kPropWidth(context, 1),
            child: const Text(
              "with 03 Couries",
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w300,
                  fontFamily: kFontFamily,
                  color: kGrayColor),
            ),
          )
        ],
      ),
    );
  }
}

class OtherFacilityCard extends StatelessWidget {
  Map<String, dynamic> data;
  OtherFacilityCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kA_16,
      width: kPropWidth(context, 0.45),
      height: 100,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: Border.all(color: kBlackColor, width: 1.6),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                Icons.home_outlined,
                color: kGrayColor,
                size: 14.0,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Other",
                style: TextStyle(
                    fontSize: 10, fontFamily: kFontFamily, color: kGrayColor),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: kPropWidth(context, 0.35),
                child: Text(
                  "${data['description']}",
                  maxLines: 2,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: kFontFamily,
                      color: kBlackColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Review
class ReviewCard extends StatelessWidget {
  dynamic review;
  ReviewCard({Key? key, this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kA_8,
      padding: kH_16,
      width: kPropWidth(context, 1) - 32,
      // height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(0.1),
            blurRadius: 2.0,
            offset: const Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
        color: kWhiteColor,
      ),
      child: Column(
        children: [
          //logo
          Container(
            margin: kV_16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Avatar & Name
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: kGrayColor,
                      minRadius: 24,
                      child: Image.asset(
                        "assets/img/ava_2.png",
                        fit: BoxFit.fill,
                        width: 48,
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "${review['user_name']}",
                      style: const TextStyle(
                          color: kBlackColor,
                          fontSize: 16,
                          fontFamily: kFontFamily,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                // Reviews count
                Container(
                  margin: kV_4,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        color: kOrangeColor,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "${review['rate']}",
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: kBlackColor,
                            fontSize: 16,
                            fontFamily: kFontFamily,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: kPropWidth(context, 1) - 24,
            child: Text(
              "${review['review']}",
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              maxLines: 8,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  fontFamily: kFontFamily,
                  color: kGrayColor),
            ),
          )
        ],
      ),
    );
  }
}

// Owener Details
class OwnerDetails extends StatelessWidget {
  Map<String, dynamic> details;
  OwnerDetails({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kV_16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: kGrayColor,
                minRadius: 24,
                child: Image.asset(
                  "${details['image']}",
                  fit: BoxFit.fill,
                  width: 48,
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${details['name']}",
                    style: const TextStyle(
                        color: kBlackColor,
                        fontSize: 16,
                        fontFamily: kFontFamily,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${details['who']}",
                    style: const TextStyle(
                        color: kGrayColor,
                        fontSize: 12,
                        fontFamily: kFontFamily,
                        fontWeight: FontWeight.w200),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message_outlined),
                splashRadius: 24.0,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.call_outlined),
                splashRadius: 24.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
