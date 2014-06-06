    #### Routes
    # We are setting up theese routes:
    #
    # GET, POST, PUT, DELETE methods are going to the same controller methods - we dont care.
    # We are using method names to determine controller actions for clearness.

    routeMvc = require './lib/route_mvc'

    module.exports = (app) ->
      
      # simple session authorization
      checkAuth = (req, res, next) ->
        unless req.session.authorized
          res.statusCode = 401
          res.render '401', 401
        else
          next()
      

      app.all '/private', checkAuth, (req, res, next) ->
        routeMvc('private', 'index', req, res, next)  
      
      #   - _/_ -> controllers/index/index method
      app.all '/', (req, res, next) ->
        routeMvc('index', 'index', req, res, next)

      #   - _/**:controller**_  -> controllers/***:controller***/index method
      app.get '/:controller', (req, res, next) ->
        routeMvc(req.params.controller, 'index', req, res, next)

Deviations from twilson63 template
----------------------------------
I want the more traditional rails REST routes

      app.post '/:controller', (req, res, next) ->
        routeMvc(req.params.controller, 'create', req, res, next)

      app.put '/:controller/:id', (req, res, next) ->
        routeMvc(req.params.controller, 'update', req, res, next)

      app.delete '/:controller/:id', (req, res, next) ->
        routeMvc(req.params.controller, 'delete', req, res, next)

      #   - _/**:controller**/**:method**_ -> controllers/***:controller***/***:method*** method
      app.all '/:controller/:method', (req, res, next) ->
        routeMvc(req.params.controller, req.params.method, req, res, next)

      #   - _/**:controller**/**:method**/**:id**_ -> controllers/***:controller***/***:method*** method with ***:id*** param passed
      app.all '/:controller/:method/:id', (req, res, next) ->
        routeMvc(req.params.controller, req.params.method, req, res, next)

      app.get '/sessions/create/:code', (req, res, next) ->
        req.send(session.accessToken)

      # If all else failed, show 404 page
      app.all '/*', (req, res) ->
        console.warn "error 404: ", req.url
        res.statusCode = 404
        res.render '404', 404

