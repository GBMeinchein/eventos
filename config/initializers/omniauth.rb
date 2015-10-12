#OmniAuth.config.logger = Rails.logger

#Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :facebook, '1630556977233255', 'ac5f9e177681af0a8e6cae1baf04fffb', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
#end

Rails.application.config.middleware.use OmniAuth::Builder do
     provider :facebook, '1630556977233255', 'ac5f9e177681af0a8e6cae1baf04fffb', :scope => "email"
   end