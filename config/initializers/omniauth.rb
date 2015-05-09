OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '751496528958-v4kr77fuktu3eq0mb2trvlofr128ramg.apps.googleusercontent.com', 'f3AryFrylkpCLRx5rBIJRe5W', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
