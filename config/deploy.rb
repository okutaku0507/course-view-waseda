require "bundler/capistrano"

set :application, "course-view-waseda"
set :rails_env, "production"

server "course-view.com", :web, :app, :db, primary: true

set :repository, "git@bitbucket.org:suzukiokuhara/course-view-waseda.git"
set :scm, :git
set :branch, "master"
set :user, "rails"
set :use_sudo, false
set :deploy_to, "/var/#{user}/#{rails_env}"
set :deploy_via, :copy
set :copy_cache, true
ssh_options[:forward_agent] = true

after "deploy:update", roles: :app do
  run "bin/cp #{shared_path}/config/database.yml #{release_path}/config/"
end

namespace :deploy do
  desc "Restarts your application."
  task :restart do
    run "mkdir -p #{shared_path}/tmp"
    run "touch #{shared_path}/tmp/restart.txt"
  end
end