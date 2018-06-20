set :stage, :production
server '45.56.120.108', user: 'deploy', roles: %w{app web db}


role :app, %w{deploy@45.56.120.108}
role :web, %w{deploy@45.56.120.108}
role :db,  %w{deploy@45.56.120.108}


set :branch, 'master'
set :rails_env, :production
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_workers, 4
set :sidekiq_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :sidekiq_concurrency, 10
set :sidekiq_default_hooks, true
set :sidekiq_config, "#{current_path}/config/sidekiq.yml"
