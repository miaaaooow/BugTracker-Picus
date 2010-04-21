# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bugtracker-picus_session',
  :secret      => '9315cda94458b9c91ed536883a373ba061f147a473fe03f536a95c78a812a330d2a53dcc8c68f0d7639323bd816187c0f2d1ff134ac076ed685629c1af91dd31'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
