Posts controller
----------------
I am reusing the twilson63 template 
Post model's CRUD controller.

    Post = require '../models/post'
    
    module.exports = 

Here we list all posts and we already know that that
the routeMvc code will set the index action to be
routed to /posts
      
      index: (req, res) ->
        Post.find {}, (err, posts) ->
          res.send posts
          
Here we create a new post with data from `req.body`. 
It is important to not that the routeMvc function will
publish this route to /posts/create. It may be that we
want to go back in later and translate to a more traditional
post to /posts route
      
      create: (req, res) ->
        post = new Post req.body
        post.save (err, post) ->
          if not err
            res.send post
            res.statusCode = 201
          else
            res.send err
            res.statusCode = 500
            
This is the show action, again the twilson63 template creates
the route /posts/show/:id, I may try to get this to conform
to may conventional rest standards later

      show: (req, res) ->
        Post.findById req.params.id, (err, post) ->
          if not err
            res.send post
          else
            res.send err
            res.statusCode = 500
                 
This is the update function, at /posts/update, I have the same
issues with this route as above

      update: (req, res) ->
        Post.findByIdAndUpdate req.params.id, {"$set":req.body}, (err, post) ->
          if not err
            res.send post
          else
            res.send err
            res.statusCode = 500
        
This route is /posts/delete, same as in above routes

      delete: (req, res) ->
        Post.findByIdAndRemove req.params.id, (err) ->
          if not err
            res.send {}
          else
            res.send err
            res.statusCode = 500
      
  