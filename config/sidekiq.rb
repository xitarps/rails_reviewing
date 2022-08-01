# SideKiq.configure_server do |config|
#   config.redis = { url: "redis://#{ENV['DATA_REDIS']}:6379/1"}
# end

# SideKiq.configure_client do |config|
#   config.redis = { url: "redis://#{ENV['DATA_REDIS']}:6379/1"}
# end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/1') }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/1') }
end
