General Purpose Config File
---------------------------

    secrets = require('./secrets')
    console.log secrets

    exports.setEnvironment = (env) ->
      console.log "set app environment: #{env}"
      
      switch(env)
        when "development"
          exports.DEBUG_LOG = true
          exports.DEBUG_WARN = true
          exports.DEBUG_ERROR = true
          exports.DEBUG_CLIENT = true
          exports.DB_HOST = 'localhost'
          exports.DB_PORT = "3306"
          exports.DB_NAME = 'mvc_example'
          exports.DB_USER = 'root'
          exports.DB_PASS = 'root'
          exports.FACEBOOK_APP_ID = secrets.FACEBOOK_APP_ID
          exports.FACEBOOK_SECRET = secrets.FACEBOOK_SECRET
        when "testing"
          exports.DEBUG_LOG = true
          exports.DEBUG_WARN = true
          exports.DEBUG_ERROR = true
          exports.DEBUG_CLIENT = true
          exports.FACEBOOK_APP_ID = secrets.FACEBOOK_APP_ID
          exports.FACEBOOK_SECRET = secrets.FACEBOOK_SECRET

        when "production"
          exports.DEBUG_LOG = false
          exports.DEBUG_WARN = false
          exports.DEBUG_ERROR = true
          exports.DEBUG_CLIENT = false
        else
          console.log "environment #{env} not found"