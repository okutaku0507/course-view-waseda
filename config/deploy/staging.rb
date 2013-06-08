set :rails_env, "staging"

server "st.course-view.com", :web, :app, :db, :primary => true
set :deploy_to, "/var/#{user}/#{rails_env}"