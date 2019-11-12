Aws.config.update({
    region: 'us-east-2',
    credentials: Aws::Credentials.new(ENV.fetch("PERSONAL_WEBSITE_ACCESS_KEY_ID"),
                                      ENV.fetch("PERSONAL_WEBSITE_SECRET_ACCESS_KEY"))
})