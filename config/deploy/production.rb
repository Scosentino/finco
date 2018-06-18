set :stage, :production
server 'your_server_ip', user: 'deploy', roles: %w{app web db}


role :app, %w{deploy@your_server_ip}
role :web, %w{deploy@your_server_ip}
role :db,  %w{deploy@your_server_ip}


set :branch, 'master'
set :rails_env, :production
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_workers, 2
