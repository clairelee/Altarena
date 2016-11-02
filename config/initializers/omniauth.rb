OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '883535568446847', 'b7b37b9531262103f078bfb60eb724a9'
  provider :linkedin, '75vv91wj8zsih3', 'pz0PZ28ZbgRZd6wh'
end