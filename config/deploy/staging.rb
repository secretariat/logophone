role :web, "54.187.99.148"
role :app, "54.187.99.148"
role :db,  "54.187.99.148", :primary => true
role :db,  "54.187.99.148"

set :user, "ubuntu"
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:auth_methods] = ["publickey"]
ssh_options[:port] = 22
ssh_options[:keys] = ["#{ENV['HOME']}/install/ruby/amazon/vps_backup.pem"]


set :deploy_to, "/home/ubuntu/www/sites/logophone"

namespace :deploy do

  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :bundle do
    run "cd #{release_path} && bundle install --gemfile #{release_path}/Gemfile"
  end

  task :assets do
    run "cd #{release_path} && bundle exec rake RAILS_ENV=production RAILS_GROUPS=assets assets:precompile"
  end

  task :migrations do
    run "cd #{release_path} && bundle exec rake db:migrate RAILS_ENV=production"
  end

  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/output #{release_path}/public/output"
  end

  # task :refresh_sitemaps do
  #   run "cd #{latest_release} && RAILS_ENV=#{rails_env} rake sitemap:refresh"
  # end
end
