# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_remindo_app_session',
  :secret      => '4fa8db9edd47a35611005b7db73ddc9c9db5988781838d58e7e4d5643c60c00ebbfea04ac8399ad80c7ef1faf1c2edb81a3a48334fe5957c6aafac03b9b51ed1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
