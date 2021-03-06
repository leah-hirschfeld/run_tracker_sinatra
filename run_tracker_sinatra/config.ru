require './config/environment'
require 'pry'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use RunsController
use UsersController
run ApplicationController
