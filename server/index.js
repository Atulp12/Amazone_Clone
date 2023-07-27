console.log('Hello User!!');

//similar like import
const express = require('express');
const mongoose = require('mongoose');



//Importing auth.js file -->
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/product');
const userRouter = require('./routes/user');

//INIT
const PORT = process.env.PORT || 3000;
const app = express();
const DB = "mongodb+srv://atul:abc%40123@cluster0.fq8liqe.mongodb.net/?retryWrites=true&w=majority";


//Middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);


//Connections
mongoose.connect(DB).then(() => {
    console.log('Connection Successfully!!');
}).catch((e) => {
    console.log(e);
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected to port ${PORT}`);
});