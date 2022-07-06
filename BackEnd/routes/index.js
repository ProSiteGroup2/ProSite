const express=require('express');
const router= express.Router();
const actions=require('../methods/actions');
const multer=require('multer');



//http requests get,post,update,delete

router.get('/',function(req,res){
    res.send('Hello World');
});


// setup the storage for image upload
const storage=multer.diskStorage({
    destination:function(req,file,cb){
        cb(null,'../upload');
    },

    filename:function(req,file,cb){
        cb(null,Date.now()+file.originalname);
    }
});

//upload parameters for multer
 const upload=multer({
    storage:storage
 });

 

//add a new Consumer
router.post('/addConsumer', actions.addNewConsumer);

//add a new Labour
router.post('/addLabour',actions.addNewLabour);

//add a new Hardware
router.post('/addHardware',actions.addNewHardware);

//add a new Contractor
router.post('/addContractor',actions.addNewContractor);

//add a new Transporter
router.post('/addTransporter',actions.addNewTransporter);

//add a new Product
router.post('/addProduct',upload.single('image'),actions.addNewProduct);

//authentication of a consumer
router.post('/consumerLogin', actions.authenticateConsumer);

//getting info from token
router.get('/getInfo', actions.getInfo);

//authentication of SP
router.post('/SPLogin',actions.authenticateSP);

//uploading profile images
router.post('/consumerProfile/:email',upload.single('profile'),actions.consumerProfile);

router.post('/contractorProfile/:email',upload.single('profile'),actions.contractorProfile);

router.post('/hardwareProfile/:email',upload.single('profile'),actions.hardwareProfile);

router.post('/labourProfile/:email',upload.single('profile'),actions.labourProfile);

router.post('/transporterProfile/:email',upload.single('profile'),actions.transporterProfile);

module.exports=router;