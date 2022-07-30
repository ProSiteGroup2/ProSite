import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var c_choose;
  List category=['Cement','Bricks','Steel','Sand'];
  final _formKey = GlobalKey<FormState>();

  String _productName = '';
  int? _productPrice;
  int? _stock;
  String _productSize='N/A';
  String _productCategory='';
  String _productDescription='';
  String _productBrand='N/A';
  String _productSeller='';

  void _trySubmitForm(){
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
      debugPrint(_productSeller);
    }
  }

  @override
  final item_nameController = TextEditingController();
  final item_priceController = TextEditingController();
  final item_stockController = TextEditingController();
  final item_sizeController = TextEditingController();
  final item_descriptionController = TextEditingController();
  final item_BrandController = TextEditingController();
  final item_SellerController = TextEditingController();

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [
                    SizedBox(height: 15,),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
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

                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
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

                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
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

                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
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

                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
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

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: (){},
                          child: Text(
                            'Add Image',
                            style: TextStyle(
                                fontSize: 20.0,
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

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8.0, 16.0, 0),
                          child: Container(
                            width: 120,
                            height: 80,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("assets/imgs/default-product-image.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
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
                    ElevatedButton(
                      onPressed: _trySubmitForm,
                      child: Text(
                        'Save Item',
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
