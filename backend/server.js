const express = require('express');
const mongoose = require('mongoose');
const app = express();

app.use(express.json());

mongoose.connect('mongodb://localhost:27017/food_delivery', {
    useUnifiedTopology: true,
}).then(() => console.log("connection successful")).catch((err) => console.log(err));


//Defining Schemas
const popularProductSchema = new mongoose.Schema({
    id: Number,
    name: String,
    description: String,
    price: Number,
    stars: Number,
    img: String,
    location: String,
    created_at: String,
    updated_at: String,
    type_id: Number,
});


//Defining collections
const Recommended_Products = new mongoose.model("Recommended_Product", popularProductSchema);
const Popular_Products = new mongoose.model("Popular_Product", popularProductSchema);

app.use(
    express.urlencoded(
        {
            extended: true,
        })

);

// Home Route
app.get("/", function (req, res) {
    res.send("This is the home page");
});

//Post Commands in mongodb

app.post("/api/addRecommendedProduct", async function (req, res) {
    console.log("Result", req.body);

    const data = new Recommended_Products({
        id: req.body.id,
        name: req.body.name,
        description: req.body.description,
        price: req.body.price,
        stars: req.body.stars,
        img: req.body.img,
        location: req.body.location,
        created_at: req.body.created_at,
        updated_at: req.body.updated_at,
        type_id: req.body.type_id,
    });

    const val = await data.save();
    res.json(val);

})

app.post("/api/addPopularProduct", async function (req, res) {

    const data = new Popular_Products({
        id: req.body.id,
        name: req.body.name,
        description: req.body.description,
        price: req.body.price,
        stars: req.body.stars,
        img: req.body.img,
        location: req.body.location,
        created_at: req.body.created_at,
        updated_at: req.body.updated_at,
        type_id: req.body.type_id,
    });

    const val = await data.save();
    res.json(val);

})


//Get Commands

app.get("/api/getPopularProduct", async function (req, res) {
    res.status(200).send({
        total_size: await Popular_Products.count,
        type_id: 2,
        offset: 0,
        products: await Popular_Products.find()
    });
});

app.get("/api/getRecommendedProduct", async function (req, res) {
    res.status(200).send({
        total_size: await Recommended_Products.count,
        type_id: 3,
        offset: 0,
        products: await Recommended_Products.find()
    });

});


app.listen(5000, function () {
    console.log("Server started at port 5000");
});

