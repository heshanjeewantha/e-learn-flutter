// server.js

const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const userRoutes = require('./routes/userRoutes');
const categoryRoutes = require('./routes/categoryRoutes');
const courseRoutes = require('./routes/courseRoutes');
const sectionRoutes = require('./routes/sectionRoutes');
const materialsRoutes = require('./routes/materialsRoutes');
const enrolledCourseRoutes = require('./routes/enrolledCourseRoutes');
const reviewRoutes = require('./routes/reviewRoutes'); // New review routes
const wishlistRoutes = require('./routes/wishlistRoutes'); 
const authRoutes = require('./routes/authRoutes');
const progressRoute = require('./routes/progressRoute');
// const reviewRoutes = require('./routes/reviewRoutes');
// const toolRoutes = require('./routes/toolRoutes');

const app = express();
const PORT = 3000;

// Connect to MongoDB
mongoose.connect('mongodb+srv://heshanjeewantha:6zNd3tZ8Mu03Rjnl@elerning.g6pav.mongodb.net/?retryWrites=true&w=majority&appName=elerning')
  .then(() => console.log('Connected to MongoDB'))
  .catch((error) => console.error('Could not connect to MongoDB:', error));

// Middleware
app.use(bodyParser.json());

// Routes
app.use('/api/users', userRoutes);
app.use('/api/categories', categoryRoutes);
app.use('/api/courses', courseRoutes);
app.use('/api/sections', sectionRoutes);
app.use('/api/materials', materialsRoutes);
app.use('/api/enrolledCourses', enrolledCourseRoutes); 
app.use('/api/reviews', reviewRoutes);
app.use('/api/wishlists', wishlistRoutes);
app.use('/api/auth', authRoutes);
app.use('/api/progress', progressRoute);
// app.use('/api/reviews', reviewRoutes);
// app.use('/api/tools', toolRoutes);

// Start server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
