Users controller
----------------

  

    User = require '../models/user'

    # User model's CRUD controller.
    module.exports = 
      
      # Gets user by id
      show: (req, res) ->
        User.findById req.params.id, (err, user) ->
          if not err
            res.send user
          else
            res.send err
            res.statusCode = 500
                 

          
      