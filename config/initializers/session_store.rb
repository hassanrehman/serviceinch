# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_serviceinch_session',
  :secret      => '82b5b311b00a9b571fb2edeb8f05885216a32718db26f19851fa1894c376e9b92da20ecf0bbf49f863f2dc3afc428db01b9f169d1e8d450e6ac6f49ccde85353'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
