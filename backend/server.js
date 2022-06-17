const express = require('express');
const app = express();

// Home Route
app.get("/", function (req, res) {
    res.send("This is the home page");
})

// Popular Product Route
app.get("/popular", function (req, res) {
    res.send("This is the popular page");
})

// Recommended Product Route
app.get("/recommended", function (req, res) {
    res.send("This is the recommended page");
})


app.use(express.json());

app.use(
    express.urlencoded(
        {
            extended: true,
        })
);

const productPopularData = [];
const productRecommendedData = [];


//Post Commands

app.post("/api/addRecommendedProduct", function (req, res) {
    console.log("Result", req.body);
    const singleRecommendedProductDetails = {

            id: req.body.id,
            name: req.body.name,
            description:req.body.description,
            price: req.body.price,
            stars: req.body.stars,
            img: req.body.img,
            location: req.body.location,
            created_at: req.body.created_at,
            updated_at: req.body.updated_at,
            type_id: req.body.type_id,
    }
    productRecommendedData.push(singleRecommendedProductDetails);
    console.log(productRecommendedData)

});

app.post("/api/addPopularProduct", function (req, res) {

    const singlePopularProductDetails = {

              id: req.body.id,
              name: req.body.name,
              description:req.body.description,
              price: req.body.price,
              stars: req.body.stars,
              img: req.body.img,
              location: req.body.location,
              created_at: req.body.created_at,
              updated_at: req.body.updated_at,
              type_id: req.body.type_id
            }
    productPopularData.push(singlePopularProductDetails);
    console.log("Result", req.body);

});


//Get Commands

app.get("/api/getPopularProduct", function (req, res) {
    res.status(200).send({
        total_size: productPopularData.length,
        type_id: 2,
        offset: 0,
        products: productPopularData
    });
});

app.get("/api/getRecommendedProduct", function (req, res) {
    res.status(200).send({
        total_size: productPopularData.length,
        type_id: 3,
        offset: 0,
        products: productRecommendedData
    });

});


app.listen(5000, function () {
    console.log("Server started at port 5000");
});

