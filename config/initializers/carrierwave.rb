CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAJPRCJH4HEHX7BZKQ',
      :aws_secret_access_key  => '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',
      :region                 => 'us-east-1'
  }
  config.fog_directory  = 'italmons-dev'
  # config.asset_host     = 'https://assets.example.com'
  # config.fog_public     = true
  config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
end