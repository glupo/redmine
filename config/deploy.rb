
require "rvm/capistrano"
require 'bundler/capistrano'

set :application, 'Redmine'
set :repository, 'git@github.com:glupo/redmine.git'

set :scm, :git

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`


server '172.20.61.45', :app, :web, :db, :primary => true

set :user, 'user'
set :password, 'qwaszx@1'
set :use_sudo, false
set :rails_env, "production"

set :app_dir, "/home/#{user}/#{application}"
set :deploy_to, "#{app_dir}"

namespace :deploy do
  task :symlink_shared do
    run "ln -s #{shared_path}/config/database.yml #{release_path}/config/"
  end
  task :migrate_prod_database, :roles => :db do
    run "cd #{current_path} && bundle exec rake db:migrate RAILS_ENV=#{rails_env}" 
  end
end

before "bundle:install", "deploy:symlink_shared"
before "deploy:restart", "deploy:migrate_prod_database"
