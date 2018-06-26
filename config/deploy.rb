set :application, 'finco'
set :deploy_to, '/home/deploy/apps'
set :repo_url, 'git@github.com:Scosentino/finco.git'
# set :pty, true
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/puma.rb', 'config/application.yml')
set :sidekiq_config, "#{current_path}/config/sidekiq.yml"
set :sidekiq_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :sidekiq_concurrency, 10
set :sidekiq_default_hooks, true
set :keep_releases, 5
