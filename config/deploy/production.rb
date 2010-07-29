# Production cap file

server "reminderhawk.com", :app, :web, :db, :primary => true
set :repository,  "git@git.muziboo.com:remindo-app.git"

namespace(:deploy) do
  task :restart, :role => :app do
    run <<-CMD
      cd #{release_path} && mongrel_rails stop && mongrel_rails start -e production -d -p 3002
    CMD
  end
end
