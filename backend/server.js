const express = require('express');
const mongooseDatabase = require('./mongoose/mongoose_database');
const app = express();
const mongooseModel = new mongooseDatabase();

app.use(express.json());

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
    await mongooseModel.insertRecommended(req.body).then((data) => {
        res.json(data);
    });
})

app.post("/api/addPopularProduct", async function (req, res) {

    await mongooseModel.insertPopular(req.body).then((data) => {
        res.json(data);
    });

})

//Get Commands

app.get("/api/getPopularProduct", async function (req, res) {
    await mongooseModel.getAllPopularProduct()
        .then((popularList) => {
            res.status(200).send({
                total_size: Object.keys(popularList).length,
                type_id: 2,
                offset: 0,
                products: popularList
            });
        });
});

app.get("/api/getRecommendedProduct", async function (req, res) {
    await mongooseModel.getAllRecommendedProduct()
        .then((recommendedList) => {
            res.status(200).send({
                total_size: Object.keys(recommendedList).length,
                type_id: 2,
                offset: 0,
                products: recommendedList
            });
        });

});

mongooseModel.launch().then(() => {
    console.log('Connection to mongoose is completed');
});

app.listen(5000, function () {
    console.log("Server started at port 5000");
});

