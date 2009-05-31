# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_random_photo_generator_session',
  :secret      => '282650bf87b936a0b171cfcaebce2ba8edffd8ffbf091d47c30867b85a5beba7b2967a9642ee030764bc8bc6fbe6b693e7854fe94ff3318869e3d548b363cd09'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
