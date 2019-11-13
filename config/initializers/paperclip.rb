Paperclip::Attachment.default_options.update({
    storage: :s3,
    s3_protocol: 'https',
    s3_host_name: 's3-us-east-2.amazonaws.com',
    s3_credentials: {
        s3_region: ENV.fetch('PERSONAL_WEBSITE_S3_REGION'),
        bucket: ENV.fetch('PERSONAL_WEBSITE_BUCKET_NAME'),
        access_key_id: ENV.fetch('PERSONAL_WEBSITE_ACCESS_KEY_ID'),
        secret_access_key: ENV.fetch('PERSONAL_WEBSITE_SECRET_ACCESS_KEY')
    }
})