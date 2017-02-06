Devise.setup do |config|
  # Other configuration...

  # ==> OmniAuth
  # Add a OmniAuth providers.
  User.omniauth_providers.each do |provider_name|
    if provider_name == :developer
      config.omniauth :developer
    else
      api_key = ENV["#{provider_name.upcase}_API_KEY"]
      api_secret = ENV["#{provider_name.upcase}_API_SECRET"]
      config.omniauth provider_name, api_key, api_secret
    end
  end
end
