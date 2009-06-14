# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Users
user1 = User.create!(:login => 'zender', :password => 'secret', :password_confirmation => 'secret', :role => User::ROLES[:sender])
user2 = User.create!(:login => 'ontvanger', :password => 'secret', :password_confirmation => 'secret', :role => User::ROLES[:receiver])
user3 = User.create!(:login => 'onderzoeker', :password => 'secret', :password_confirmation => 'secret', :role => User::ROLES[:researcher])

# Sessions
session1 = Session.create!(:sample_size => 8, :sender => user1)

# Trials
trial1 = Trial.create!(:session => session1, :receiver => user2, :hit => true)
trial2 = Trial.create!(:session => session1, :receiver => user2, :hit => false)
trial3 = Trial.create!(:session => session1, :receiver => user2, :hit => true)
trial4 = Trial.create!(:session => session1, :receiver => user2, :hit => true)