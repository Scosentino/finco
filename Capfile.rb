# Load DSL and set up phases
require "capistrano/setup"


#include default deployment tasks
require "capistrano/deploy"


# Load the SCM plugin appropriate to your project:
#
# require "capistrano / scm / hg"
# install_plugin Capistrano :: SCM :: Hg
# or
# require "capistrano / scm / svn"
# install_plugin Capistrano :: SCM :: Svn
# or
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git


# Include capistrano-rails
require 'capistrano/rails'
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require 'capistrano/rails/assets'
require 'capistrano/puma' 
install_plugin Capistrano::Puma   # Default puma tasks
install_plugin Capistrano::Puma::Nginx


# Load custom tasks from `lib / capistrano / tasks`  if  you have any defined
Dir.glob("lib/capistrano/tasks/*.rake ").each {|r| import r  }
