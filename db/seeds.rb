# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Users
user1 = User.create!(:login => 'zender', :password => 'secret', :password_confirmation => 'secret',
                      :role => User::ROLES[:sender])
user2 = User.create!(:login => 'ontvanger', :password => 'secret', :password_confirmation => 'secret',
                      :role => User::ROLES[:receiver])
user3 = User.create!(:login => 'onderzoeker', :password => 'secret', :password_confirmation => 'secret',
                      :role => User::ROLES[:researcher])

# Samples
sample1 = Sample.create!(:description => 'Foto 1', :size => 40, :content_type => 'image/jpeg', :filename => 'foto1.jpg',
                          :height => 120, :width => 50, :parent_id => nil, :thumbnail => nil, :db_file_id => 1)
sample2 = Sample.create!(:description => 'Foto 2', :size => 20, :content_type => 'image/jpeg', :filename => 'foto2.jpg',
                          :height => 110, :width => 40, :parent_id => nil, :thumbnail => nil, :db_file_id => 2)
sample3 = Sample.create!(:description => 'Foto 3', :size => 30, :content_type => 'image/jpeg', :filename => 'foto3.jpg',
                          :height => 130, :width => 20, :parent_id => nil, :thumbnail => nil, :db_file_id => 3)
sample4 = Sample.create!(:description => 'Foto 4', :size => 35, :content_type => 'image/jpeg', :filename => 'foto4.jpg',
                          :height => 100, :width => 60, :parent_id => nil, :thumbnail => nil, :db_file_id => 4)

# Sessions
session1 = Session.create!(:sender => user1, :max_sender_selection_time => 10, :sender_focus_time => 30,
                            :max_receiver_response_time => 30, :recovery_time => 15, :trial_size => 3, :sample_size => 4,
                            :genre => nil, :type => nil, :genre_type_ratio => nil, :sampling_with_replacement => true)

# Trials
trial1 = Trial.create!(:session => session1, :receiver => user2, :sender_selection_time => 5, :receiver_response_time => 23,
                        :sender_selected_sample => sample2, :receiver_selected_sample => sample2)
trial2 = Trial.create!(:session => session1, :receiver => user2, :sender_selection_time => 8, :receiver_response_time => 14,
                        :sender_selected_sample => sample4, :receiver_selected_sample => sample1)
trial3 = Trial.create!(:session => session1, :receiver => user2, :sender_selection_time => 3, :receiver_response_time => 26,
                        :sender_selected_sample => sample3, :receiver_selected_sample => sample3)

# Analysis
analysis1 = session1.create_analysis