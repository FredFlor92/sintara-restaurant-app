require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# in order to send Patch/Delete requests
use Rack::MethodOverride

use UsersController
use RestaurantEntriesController
run ApplicationController
