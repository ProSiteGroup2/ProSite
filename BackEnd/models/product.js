const mongoose=require('mongoose');
const Schema=mongoose.Schema;
const Hardware=require('./hardware');

const productSchema=new Schema({
    productname:{
        type:String,
        required:true
    },
    price:Number,
    stock:Number,
    size:Number,
    category:String,
    description:String,
    seller:{
        type: [Schema.Types.ObjectId],
        ref: 'Hardware'
   },
    image:String
});

const Product=mongoose.model('product',productSchema);
module.exports=Product;