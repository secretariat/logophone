# -*- encoding : utf-8 -*-
require 'capistrano/ext/multistage'
require "bundler/capistrano"

set :application, "logophone"
set :scm, :git
set :scm_verbose, true

set :default_shell, '/bin/bash -l'

set :repository,  "git@github.com:secretariat/logophone.git"
set :branch, 'master'

set :deploy_via, :copy
set :use_sudo, false
set :keep_releases, 5

set :stages, ["staging", "production"]
set :default_stage, "production"

after "deploy","deploy:bundle"
after "deploy:bundle", "deploy:symlink_shared"
after "deploy:symlink_shared", "deploy:assets"
after "deploy:assets", "deploy:migrations"
after "deploy:migrations", "deploy:restart"
after "deploy:create_symlink", "deploy:cleanup"
