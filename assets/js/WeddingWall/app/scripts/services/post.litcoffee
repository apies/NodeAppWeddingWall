Post service
------------

in angular a service can function much like a model akin to a more standard MVC 
approach such as Rails. The Post service will take care of CRUD operations for posts
on the wedding wall

#### Design Notes

while I love the idea of a pure functional language such as Elixir and Haskell
to me Javascript and it's dialect Coffeescript lend themselves better to object 
oriented designs.

### Post Base

Here we are creating PostBase which is a function returned from the
$resource service. The third argument adds an update method to the function.
We add this method because we know that most REST APIs use PUT for update
which clashes with ngResource using POST for update

    angular.module('weddingWallApp:services', ['ngResource'])
     .factory 'PostBase',($resource) ->
       $resource('/api/posts/:id', {id: "@id"}, {update: {method: "PUT"}})

### Post Class

Here we derive the Post class from the PostBase class. This approach
is principally motivated by the ease of use we get in adding both instance 
and class methods to the Post service via the Coffeescript class interface.

    angular.module('weddingWallApp:services').factory 'Post', (PostBase) ->
      class Post extends PostBase
        constructor: (attrs) ->
          super
          @postProcess(attrs)
        postProcess: (attrs) ->










