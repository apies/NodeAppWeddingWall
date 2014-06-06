routeMvc Routing from Twilson63
===============================

taken from https://github.com/twilson63/express-coffee
comments: 
 *render the page based on controller name, method and id*


Table of Old API -> new api changes
-----------------------------------
The below table maps out our intended API
changes in order to make the router more 
traditional REST ala Rails


| Action   | HTTP   | New HTTP | Route                   | New Route        |
|:--------:|:------:|:--------:|:----------------------- |:---------------- |
| create   | all    | post     | /:controller/create     | /:controller     |
| show     | all    | get      | /:controller/get/:id    | /:controller/:id |
| delete   | all    | delete   | /:controller/delete/:id | /:controller/:id |      
| update   | all    | put      | /:controller/update/:id | /:controller/:id |      



    module.exports = (controllerName, methodName, req, res, next) ->
      controllerName = 'index' if not controllerName?
      controller = null
      try
        controller = require "../controllers/" + controllerName
      catch e
        console.warn "controller not found: " + controllerName, e
        next()
        return
      data = null
      if typeof controller[methodName] is 'function'
        actionMethod = controller[methodName].bind controller
        actionMethod req, res, next
      else if req.method is 'GET'
        actionMethod = controller['show'].bind controller
        req.params.id = req.params.method
        actionMethod req, res, next
      # else if req.body is 'PUT'
      #   actionMethod = controller['update'].bind controller
      #   req.params.method = ""
      #   actionMethod req, res, next
      else
        console.warn 'method not found: ' + methodName
        next()