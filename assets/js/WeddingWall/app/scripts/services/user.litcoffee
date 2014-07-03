User Service
------------
I repeat the pattern I used in the post service which probably means there is some
refactoring to do in terms of making the code more DRY. 

####UserBase *explained in post.coffee*

    angular.module('weddingWallApp:services')
     .factory 'UserBase',($resource) ->
       $resource('/api/users/:id', {id: "@id"}, {update: {method: "PUT"}})

## User *explained in post.coffee*

Here we derive the User class from the UserBase class. This approach
is principally motivated by the ease of use we get in adding both instance 
and class methods to the User service via the Coffeescript class interface.

    angular.module('weddingWallApp:services').factory 'User', (UserBase) ->
      class User extends UserBase
        constructor: (attrs) ->
          super
          @postProcess(attrs)
        postProcess: (attrs) ->