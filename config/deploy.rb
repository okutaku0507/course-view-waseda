require "bundler/capistrano"

set :application, "course-view-waseda"
set :rails_env, "production"

server "course-view.com", :web, :app, :db, primary: true

set :repository, "ssh://git@bitbucket.org:suzukiokuhara/course-view-waseda.git"
set :scm, :git
set :branch, "master"
set :user, "rails"
set :use_sudo, false
set :deploy_to, "/var/#{user}/course-view-waseda"
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true