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

  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run_locally "bundle exec rake assets:precompile"
        find_servers_for_task(current_task).each do |server|
          run_locally "rsync -vr --exclude='.DS_Store' public/assets #{user}@#{domain}:#{deploy_to}/#{shared_path}/"
        end
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end

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