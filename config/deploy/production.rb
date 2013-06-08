set :rails_env, "production"

server "course-view.com", :web, :app, :db, primary: true
set :deploy_to, "/var/#{user}/#{rails_env}"