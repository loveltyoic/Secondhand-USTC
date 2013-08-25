require 'rvm/capistrano'
set :rvm_ruby_string, '2.0.0'
# require 'hoptoad_notifier/capistrano'

set :application, "secondhand-ustc"
set :domain, '106.186.24.57'
set :user, "root" # 一個伺服器上的帳戶用來放你的應用程式，不需要有sudo權限，但是需要有權限可以讀取Git repository拿到原始碼
set :branch, "master"
set :repository, "git@github.com:loveltyoic/Secondhand-USTC.git"
set :scm, "git"
set :port, "22"

set :deploy_to, "/home/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

role :web, domain
role :app, domain
role :db,  domain, :primary => true

namespace :deploy do

  task :copy_config_files, :roles => :app do
    db_config = "#{shared_path}/mongoid.yml"
    run "cp #{db_config} #{release_path}/config/mongoid.yml"
  end

  desc "install the necessary prerequisites"
  task :bundle_install, :roles => :app do
    run "cd #{release_path} && RAILS_ENV=production bundle install"
  end

  task :update_symlink do
   run "ln -s #{shared_path}/uploads #{release_path}/public/uploads"
  end

  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:update_code", "deploy:copy_config_files" # 如果將database.yml放在shared下，請打開
after "deploy:finalize_update", "deploy:bundle_install"
after "deploy:bundle_install", "deploy:update_symlink"