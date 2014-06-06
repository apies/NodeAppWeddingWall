Post Model
----------
The Post Model is the comments and pictures
users are going to post on sobs wedding wall

    mongoose = require 'mongoose'

    Post = new mongoose.Schema(
      title: String
      body: String
      url: String
    )

    module.exports = mongoose.model 'Post', Post