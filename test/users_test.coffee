require './specHelper'

request = require 'supertest'

User = require process.cwd() + '/.app/models/user'
app = require process.cwd() + '/.app'


INITIAL_DATA = {
  "email":"alan.lee.pies@gmail.com"
}

UPDATED_DATA = {
  "email":"alan.pies@gmail.com"
}

cleanDB = (done) ->
  User.remove {}, ->
    done()


describe 'User', ->
  before cleanDB
  
  user_id = null
      
  it "should be accessible by id", (done) ->
    User.create INITIAL_DATA, (err, user) ->
      request(app)
        .get("/users/#{user._id}")
        .expect 200, (err, res) ->
          res.body.should.include(INITIAL_DATA)
          res.body.should.have.property "_id"
          res.body["_id"].should.be.eql user._id.toString()
          done()
        

        
  after cleanDB
      