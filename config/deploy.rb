set :application, 'application_name'
set :deploy_to, '/home/deploy/apps'
set :repo_url, 'git@your_repo_url'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/puma.rb', 'config/application.yml')
set :keep_releases, 5
