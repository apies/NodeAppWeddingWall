User Model using Facebook data
------------------------------

When a user logs in with facebook I am going to store their information for rsvps
In order to verify unique user i will want their email, facebook_id

    mongoose = require 'mongoose'

    findOrCreate = require('mongoose-findorcreate')

    # User model
    User = new mongoose.Schema(
      email: String
      facebookId: String
      portraitLink: String
      name: String
      gender: String
      profileUrl: String
      provider: String

    )

a user also needs to have a findOrCreate method for passport,
we are just going to use a plugin

    User.plugin(findOrCreate)

    module.exports = mongoose.model 'User', User