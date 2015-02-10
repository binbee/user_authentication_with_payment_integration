OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,'815242335222768','d69c51073c30a9f8efe031eca0f93a4c'
end

