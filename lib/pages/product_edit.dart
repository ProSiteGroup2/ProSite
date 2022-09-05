import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group2/Classes/image_upload.dart';
import 'package:group2/Classes/product_methods.dart';
import 'package:image_picker/image_picker.dart';
import 'package:group2/globals.dart';


class editProduct extends StatefulWidget {
  const editProduct({Key? key}) : super(key: key);

  @override
  State<editProduct> createState() => _editProductState();
}

class _editProductState extends State<editProduct> {

  var c_choose;
  List category=['Cement','Bricks','Steel','Sand'];
  final _formKey = GlobalKey<FormState>();

  File? image;
  File def_image=File('assets/imgs/default-product-image.jpg');

  pickImage(ImageSource source) async {
    try {
      final image=await ImagePicker().pickImage(source: source);
      if(image==null) return;

      final imageTemporary=File(image.path);
      setState(()=>this.image=imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  String _productName = product['productname'];
  int _productPrice=product['price'];
  int _stock=product['stock'];
  String _productSize=product['size'];
  String _productCategory=product['category'];
  String _productDescription=product['description'];
  String _productBrand=product['brand'];


  Future<void> _trySubmitForm() async {
    final bool? isValid = _formKey.currentState?.validate();

    if (isValid == true){
      debugPrint('Everything looks good!');
      debugPrint(_productName);
      debugPrint('$_productPrice');
      debugPrint('$_stock');
      debugPrint(_productSize);
      debugPrint(_productCategory);
      debugPrint(_productDescription);
      debugPrint(_productBrand);

      if(image==null){
        var result=await ProductMethods().updateProduct(product['_id'], _productName, _productPrice, _productSize, _stock, _productBrand, _productDescription, _productCategory);
        if(result.data['success']){

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Product Updated Successfully'),
              content: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 60,
              ),
              actions: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/hdNavBar', (route) => false);
                    },
                    child: Text('Done'),
                  ),
                )
              ],
            ),
          );
        }
      }else{
        await ProductMethods().updateProduct(product['_id'], _productName, _productPrice, _productSize, _stock, _productBrand, _productDescription, _productCategory).then((val) async {
          if(val.data['success']){
            var local_product=val.data['product'];
            await ImgUpload().productImage(image!, local_product['_id']).then((val2) async {
              if(val2.data['success']){
                local_product=val2.data['product'];
                await Fluttertoast.showToast(
                    msg: val2.data['msg'],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Product Updated Successfully'),
                    content: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 60,
                    ),
                    actions: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, '/hdNavBar', (route) => false);
                          },
                          child: Text('Done'),
                        ),
                      )
                    ],
                  ),
                );
              }else{
                Fluttertoast.showToast(
                    msg: val.data['msg'],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            });
          }else{
            Fluttertoast.showToast(
                msg: val.data['msg'],
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        });
      }
    }
  }
  @override
  void initState() {
    super.initState();
    item_nameController.text='${product['productname']}';
    item_priceController.text='${product['price']}';
    item_stockController.text='${product['stock']}';
    item_sizeController.text='${product['size']}';
    item_descriptionController.text='${product['description']}';
    item_BrandController.text='${product['brand']}';

  }

  @override
  final item_nameController = TextEditingController();
  final item_priceController = TextEditingController();
  final item_stockController = TextEditingController();
  final item_sizeController = TextEditingController();
  final item_descriptionController = TextEditingController();
  final item_BrandController = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF189AB4),
        title: Text('Add Your Item',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold
          ),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget> [
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Item Name',
                      style: TextStyle(
                        fontSize: 18.0
                      ),
                      textAlign: TextAlign.left,),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(10, 12),
                          ),
                        ],
                      ),
                      // color: Colors.transparent,
                      child: TextFormField(
                        controller: item_nameController,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          fillColor: Colors.white,
                          filled: true,
                          floatingLabelBehavior:
                          FloatingLabelBehavior.never,
                          hintText: 'Enter Item Title',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon:
                          const Icon(Icons.short_text_rounded, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Item Title',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the product title';
                          }
                          return null;
                        },
                        onChanged: (value) => _productName = value,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.grey, width: 3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButtonFormField(
                          validator: (value) {
                            if (value == null) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          //onChanged: (value) => _userDistrict = value,
                          hint: Text('Select Product Category'),
                          dropdownColor: Colors.white,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blue,
                          ),
                          iconSize: 42.0,
                          //underline: SizedBox(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                          value: c_choose,
                          onChanged: (newValue) {
                            setState(() {
                              c_choose = newValue;
                              _productCategory=c_choose;
                            });
                          },
                          items: category.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Price',
                        style: TextStyle(
                            fontSize: 18.0
                        ),
                        textAlign: TextAlign.left,),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(10, 12),
                          ),
                        ],
                      ),
                      // color: Colors.transparent,
                      child: TextFormField(
                        controller: item_priceController,
                        keyboardType:TextInputType.number,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          fillColor: Colors.white,
                          filled: true,
                          floatingLabelBehavior:
                          FloatingLabelBehavior.never,
                          hintText: 'Enter the Price (Rs.)',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon:
                          const Icon(Icons.price_change, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Price (Rs.)',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the item price';
                          }
                          return null;
                        },
                        onChanged: (value) => _productPrice = int.parse(value),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Size',
                        style: TextStyle(
                            fontSize: 18.0
                        ),
                        textAlign: TextAlign.left,),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(10, 12),
                          ),
                        ],
                      ),
                      // color: Colors.transparent,
                      child: TextFormField(
                        controller: item_sizeController,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          fillColor: Colors.white,
                          filled: true,
                          floatingLabelBehavior:
                          FloatingLabelBehavior.never,
                          hintText: 'Enter Product Size',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon:
                          const Icon(Icons.fullscreen, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Size with Unit (Optional)',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            _productSize='N/A';
                          }
                          return null;
                        },
                        onChanged: (value) => _productSize = value,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Stock',
                        style: TextStyle(
                            fontSize: 18.0
                        ),
                        textAlign: TextAlign.left,),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(10, 12),
                          ),
                        ],
                      ),
                      // color: Colors.transparent,
                      child: TextFormField(
                        controller: item_stockController,
                        keyboardType:TextInputType.number,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          fillColor: Colors.white,
                          filled: true,
                          floatingLabelBehavior:
                          FloatingLabelBehavior.never,
                          hintText: 'Enter Product Stock',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon:
                          const Icon(Icons.store, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Product Stock',

                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the product stock';
                          }

                          return null;
                        },
                        onChanged: (value) => _stock = int.parse(value),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Brand',
                        style: TextStyle(
                            fontSize: 18.0
                        ),
                        textAlign: TextAlign.left,),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(10, 12),
                          ),
                        ],
                      ),
                      // color: Colors.transparent,
                      child: TextFormField(
                        controller: item_BrandController,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          fillColor: Colors.white,
                          filled: true,
                          floatingLabelBehavior:
                          FloatingLabelBehavior.never,
                          hintText: 'Enter Product Brand (Optional)',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon:
                          const Icon(Icons.brightness_auto, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Brand (Optional)',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            _productBrand='N/A';
                          }
                          return null;
                        },
                        onChanged: (value) => _productBrand = value,
                      ),
                    ),

                    Column(
                      children: [
                        SizedBox(height: 15,),
                        Text('Add an Item Image',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 10.0,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: ()=>pickImage(ImageSource.gallery),
                                  child: Text(
                                    'Pick Gallery',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF75E6DA),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 25.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.0,),
                                ElevatedButton(
                                  onPressed: ()=>pickImage(ImageSource.camera),
                                  child: Text(
                                    'Pick Camera',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF75E6DA),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 25.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8.0, 16.0, 0),
                              child: Container(
                                width: 150,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: image !=null? FileImage(image!):NetworkImage('${product['imageUrl']}') as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('Description',
                        style: TextStyle(
                            fontSize: 18.0
                        ),
                        textAlign: TextAlign.left,),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(10, 12),
                          ),
                        ],
                      ),
                      // color: Colors.transparent,
                      child: TextFormField(
                        controller: item_descriptionController,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          fillColor: Colors.white,
                          filled: true,
                          floatingLabelBehavior:
                          FloatingLabelBehavior.never,
                          hintText: 'Product Description',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon:
                          const Icon(Icons.description, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Description',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the item description';
                          }

                          return null;
                        },
                        onChanged: (value) => _productDescription = value,
                      ),
                    ),


                    SizedBox(height: 20.0,),
                    Center(
                      child: ElevatedButton(
                        onPressed: _trySubmitForm,
                        child: Text(
                          'Update',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF189AB4),
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 25.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
