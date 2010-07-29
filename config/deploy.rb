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
after "deploy:update_code", "reminderhawk:config"
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
