SimpleRoles.configure do |config|
  config.valid_roles = [:project_manager, :developer]
  config.strategy = :many # Default is :one
end
