The Sessions Route is Where I will handle Facebook logins
=========================================================

The principal idea is that we don't risk our own necks storing passwords
instead we let Facebook handle storing passwords and we just bandwagon on
their omni-auth protocol authentication system.

Login Strategy
--------------

After a successful Facebook login redirect I will use a findOrCreate 
clause on the users table

I am reusing the traditional rails session routes for auth.
The syntax is weird in that the controller has methods that 
return self executing functions. I imagine this is done to 
make a closure for preserving state, but to be honest I just
stole the answer from stack overflow.

    User = require '../models/user'
    passport = require 'passport'

    module.exports = 

      login: (req, res, next) ->
        passport.authenticate('facebook')(req, res, next);
      
      create: (req, res, next) ->
        passport.authenticate('facebook',
          successRedirect: '/'
          failureRedirect: '/login'
        )(req, res, next)
        