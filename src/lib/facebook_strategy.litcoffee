USING PASSPORT TO AUTH FACEBOOK
-------------------------------

    secrets =  require('../config/secrets')
    User = require('../models/user')

    clientID = secrets.FACEBOOK_APP_ID
    clientSecret = secrets.FACEBOOK_SECRET
    callbackURL = 'http://localhost:3000/sessions/create'
    enableProof = false

    passport = require('passport')
    FacebookStrategy = require('passport-facebook').Strategy

###Strategy

I am going to receieve the response packet back from facebook auth
with that response packet I am going to findOrCreate a user. It is
important to note that the findOrCreate plugin I am using uses a different 
syntax than that of ActiveRecord, the find clause can only contain one 
attribute and the second argument to the call is attributes to be updated.

*I wonder If I should just be upserting* 

#### Coffeescript

if you dont think the below pattern matching and elegant nested function
syntax is effecient you probably prefer to not write your calculus using 
Leibniz's notation. *thrice the quantity differentiated with respect to ...*

    passport.use new FacebookStrategy({clientID, clientSecret, callbackURL, enableProof}, 
      (accessToken, refreshToken, profile, done) ->      
        User.findOrCreate(facebookId: profile.id, profile, (err, user) ->
          done(err, user)
        )
    )

#### *Serializing Users?*

I will also need to tell express how to serialize the user into a session
in truth im not exactly sure of the magic going on behind
    
    passport.serializeUser( (user, done) ->
      done null, user.id
    )

    passport.deserializeUser( (id, done) ->
      User.findById( id, (err, user) ->
        done err, user
      )
    )












    