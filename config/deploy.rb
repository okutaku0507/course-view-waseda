require "bundler/capistrano"
set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

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

namespace :deploy do
  desc "Disable the app, run migrations, and enable the app."
  task :upgrade do
    web.disable
    migrations
    web.enable
  end
end

namespace :db do
  desc "Dump the database and compress it."
  task :backup, :roles => :db, :only => { :primary => true } do
    backups_path = "#{shared_path}/db_backups"

    data = capture "cat #{current_path}/config/database.yml"
    config = YAML::load(data)[rails_env]
    abort unless config && config['adapter'] == 'mysql2'

    file_name = "#{config['database']}-#{release_name}.sql.gz"

    command = "/usr/bin/mysqldump --user=#{config['username']}"
    command += " --password" if config['password']
    command += " --host=#{config['host']}" if config['host']
    command += " --port=#{config['port']}" if config['port']
    command += " #{config['database']}"
    command += " | gzip -c > #{backups_path}/#{file_name}"

    run "mkdir -p #{backups_path}"
    run command do |channel, _, output|
      if output =~ /^Enter password:/
        channel.send_data "#{config['password']}\n"
      end
    end
  end
end
