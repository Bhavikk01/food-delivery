const mongoose = require('mongoose');

const RecommendedFoodSchema = mongoose.Schema(
    {
        id: {
            type: Number,
            required: true,
        },
        name: {
            type: String,
            required: true
        },
        description: {
            type: String,
            required: true
        },
        price: {
            type: Number,
            required: true,
        },
        stars: {
            type: Number,
            required: true,
        },
        img: {
            type: String,
            required: true,
        },
        location: {
            type: String,
            required: true,
        },
        created_at: {
            type: String,
            required: true,
        },
        updated_at: {
            type: String,
            required: true,
        },
        type_id: {
            type: String,
            required: true,
        },
    }
);

module.exports = mongoose.model('Recommended_Product', RecommendedFoodSchema);
