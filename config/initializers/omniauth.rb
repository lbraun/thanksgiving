OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    client_id = '751496528958-7c3pji7tqjmk04stbadth7i7tvgi610t.apps.googleusercontent.com'
    client_secret = 'JgUnFJVDGI_OsupoKQWj_0kI'
  else
    client_id = '751496528958-v4kr77fuktu3eq0mb2trvlofr128ramg.apps.googleusercontent.com'
    client_secret = 'f3AryFrylkpCLRx5rBIJRe5W'
  end
  provider :google_oauth2, client_id, client_secret, {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
