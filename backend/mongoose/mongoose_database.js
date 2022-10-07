const mongoose = require('mongoose');
const RecommendedFoodModel = require('../model/recommended_food_model');
const PopularFoodModel = require('../model/popular_food_model');

class MongooseDatabase {
    constructor() {
        this.mongooseUrl = 'mongodb://localhost:27017/food_delivery';
        this.client = null;
    }

    async connect(){
        mongoose.connect( this.mongooseUrl, {
            useNewUrlParser: true,
            useUnifiedTopology: true
        })
            .then((client) => {
                this.client = client;
                return this.client;
            })
            .catch( (error) => {
                console.log('Error occurred: ' + error );
            });
    }

    async getAllPopularProduct(){
        return PopularFoodModel.find({});
    }

    async getAllRecommendedProduct(){
        return PopularFoodModel.find({});
    }

    async insertRecommended(data){
        const item = RecommendedFoodModel({
            id: data.id,
            name: data.name,
            description: data.description,
            price: data.price,
            stars: data.stars,
            img: data.img,
            location: data.location,
            created_at: data.created_at,
            updated_at: data.updated_at,
            type_id: data.type_id,
        });
        return await item.save();
    }

    async insertPopular(data){
        const item = PopularFoodModel({
            id: data.id,
            name: data.name,
            description: data.description,
            price: data.price,
            stars: data.stars,
            img: data.img,
            location: data.location,
            created_at: data.created_at,
            updated_at: data.updated_at,
            type_id: data.type_id,
        });
        return await item.save();
    }
    async launch(){

        console.log("Connect to mongoose");
        console.log('mongoose-connect');

        await this.connect()
            .then(() => {
                console.log('Successfully connected to mongoose');
            }).catch((err) => {
                console.log( err + ' while connecting to mongoose');
            });

    }

}

module.exports = MongooseDatabase;