WeddingWall Controller
----------------------
This controller will handle the users posting to the 'WeddingWall'. 
I will need to have realtime updates with sockets.



##Controller Setup

1.fetch all the posts from the posts json api service, the backend will have 
to limit the query to latest records

2.set up a new post on the page so the user can post a post


##Methods

1.controller method *postNow* will save the post currently being edited and 
post it to the posts json api service


##Socket.IO

experimenting with socket.io library from btford.


    WeddingWallController = ($scope, Post, socket) ->
        $scope.posts = Post.query()
        $scope.newPost = new Post(content: 'comming soon')

        $scope.postNow = ->
            $scope.newPost.$save()


##Angular Controller interface
To the angular controller interface we pass a function.
The arguments to the function are the controllers dependencies.
In this case our controller depends on the Post service to handle CRUD
operations for post objects, and the $scope service which provides access
to the controllers context.


    angular.module('weddingWallApp').controller( 'WeddingWallCtrl', WeddingWallController)



#### controllerAs Notes

In the current angular documentation they recommend using the 
controllerAs syntax but do not show how to test it. BIG TIME
LET DOWN GOOGLE! 