CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIDUOX3Q36SN3KXVA',
    :aws_secret_access_key  => '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',
    :region                 => 'us-east-1'  # optional, defaults to 'us-east-1', other eu-west-1
  }
  config.s3_bucket      = 'Rollingthemes'
  config.fog_directory  = "development"
  # config.fog_host       = 'https://assets.rolling.com'            # optional, defaults to nil
  # config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end