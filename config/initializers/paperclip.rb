Rails.application.config.papeclip_defaults = {
  storage: :s3,
  s3_credentials: {
    access_key_id: ENV.fetch('PERSONAL_WEBSITE_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('PERSONAL_WEBSITE_SECRET_ACCESS_KEY'),
    s3_region: ENV.fetch('PERSONAL_WEBSITE_S3_REGION'),
  },
  bucket: ENV.fetch('PERSONAL_WEBSITE_BUCKET_NAME')
}