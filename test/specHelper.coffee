# Spec Helper ala Rails
# ---------------------

# first set environment to testing

process.env.NODE_ENV = "testing"
config = require "../src/config/index"
config.setEnvironment("testing")


