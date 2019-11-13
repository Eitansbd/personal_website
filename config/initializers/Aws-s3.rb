Aws.config.update({
    region: ENV.fetch("PERSONAL_WEBSITE_S3_REGION"),
    credentials: Aws::Credentials.new(ENV.fetch("PERSONAL_WEBSITE_ACCESS_KEY_ID"),
                                      ENV.fetch("PERSONAL_WEBSITE_SECRET_ACCESS_KEY"))
})