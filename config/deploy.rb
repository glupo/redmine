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
