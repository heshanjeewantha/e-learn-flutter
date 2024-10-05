const mongoose = require('mongoose');

const courseSchema = new mongoose.Schema({
  id: { type: Number, unique: true },
  courseName: { type: String },
  courseImage: { type: String },
  category: { type: mongoose.Schema.Types.ObjectId, ref: 'CategoryModel' },
  description: { type: String },
  totalVideo: { type: Number },
  totalTime: { type: String },
  totalRating: { type: Number },
  sections: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Section' }],
  // reviews: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Review' }],

});  

module.exports = mongoose.model('Course', courseSchema);
