Application Main
----------------
this file handles instantiating and 

###Dependencies

    express = require 'express'
    stylus = require 'stylus'
    assets = require 'connect-assets'
    mongoose = require 'mongoose'
    session = require('express-session')
    cookieParser = require('cookie-parser')
    bodyParser = require("body-parser")
    passport = require 'passport'

    require './lib/facebook_strategy'

###Basic application initialization

1.Create app instance.
    
    app = express()

2.Define Port & Environment
    
    app.port = process.env.PORT or process.env.VMC_APP_PORT or 3000
    env = process.env.NODE_ENV or "development"

3.Config module exports has `setEnvironment` function that sets app settings depending on environment.
    
    config = require "./config"
    config.setEnvironment env

    db_config = "mongodb://#{config.DB_USER}:#{config.DB_PASS}@#{config.DB_HOST}:#{config.DB_PORT}/#{config.DB_NAME}"
    # console.log config
    # mongoose.connect db_config
    if env != 'production'
      mongoose.connect 'mongodb://localhost/example'
    else
      console.log('If you are running in production, you may want to modify the mongoose connect path')

####View initialization 

1.Add Connect Assets.
    
    app.use assets()

2.Set the public folder as static assets.

    app.use express.static(process.cwd() + '/public')

3.Set View Engine.

    app.set 'view engine', 'jade'

####Express Session

    console.log "setting session/cookie"
    app.use cookieParser()

1.[Body parser middleware](http://www.senchalabs.org/connect/middleware-bodyParser.html) parses JSON or XML bodies into `req.body` object

    app.use bodyParser()
    app.use session(
      secret: "keyboard cat"
      key: "sid"
      cookie:
        secure: true
    )



####Passport Facebook Setup

    app.use(passport.initialize())
    app.use(passport.session())


#### Finalization

1.Initialize routes

    routes = require './routes'
    routes(app)


# Export application object
    
    module.exports = app
