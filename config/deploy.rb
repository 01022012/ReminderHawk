require 'capistrano/ext/multistage'

set :application, "reminderhawk"

set :deploy_to, "/home/rails/apps/#{application}"

# Server is defined in stage specific file
set :user, 'rails'    

set :scm, "git"
set :ssh_options, { :forward_agent => true }

#set :scm_user,  Proc.new { Capistrano::CLI.ui.ask("SVN username: ")}
#set :scm_password, Proc.new { Capistrano::CLI.password_prompt("SVN password for #{scm_user}: ")} 
#set :repository, Proc.new { "--username #{scm_user} --password #{scm_password} #{repository_url}" } 
set :deploy_via, :remote_cache

set :use_sudo,  false

# Hooks to do specific stuff
after "deploy:update_code", "reminderhawk:config", "bundler:bundle_new_release"
after "deploy", "deploy:cleanup"

namespace(:reminderhawk) do
  task :config,  :roles => :app do
    %w(database.yml).each do |file|
      run <<-CMD
        ln -nfs #{shared_path}/system/#{file} #{release_path}/config/#{file}
      CMD
    end
  end

  task :symlink, :roles => :app do
    # Symlink sphinx index
    run <<-CMD
      rm #{release_path}/public/system
    CMD
  end
end

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end
  
  task :bundle_new_release, :roles => :app do
    bundler.create_symlink
    run "cd #{release_path} && bundle install --without cucumber"
  end
  
  task :lock, :roles => :app do
    run "cd #{current_release} && bundle lock;"
  end
  
  task :unlock, :roles => :app do
    run "cd #{current_release} && bundle unlock;"
  end
end

