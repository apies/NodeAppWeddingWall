 Login Controller
-----------------
The login controller handles client side auth, it is not completely
secure because the backend enforces the bulk of the security.


##Controller Setup

1.get the userId from the url paramater
..*a user with an 
id of 123 would login at *login/123*. This is not completely secure as you
can impersonate a user just by typing in their userId. However, we expect the
backend to handle encrypted session based auth preventing fake users from actually 
retreiving any real user data.

2.now we use the userId to retreive user info. Note that we use pattern matching
for style points, *{id} = {id:id}*.



    LoginController = ($scope, $rootScope, User, $routeParams, $location) ->
      id = $routeParams.userId
      currentUser = User.get({id}, (user) ->
        $rootScope.currentUser = currentUser
        $location.path('/')

      ) 





####Angular Controller Declaration *for more details see wedding_wall.litcoffee


    angular.module('weddingWallApp').controller('LoginCtrl', LoginController)





    
