class BlogPost < ApplicationRecord
  attr_accessor :content
  
  validates :title, presence: true
  validates :subtitle, presence: true
  validates :aws_obj_key, presence: true
  
  def save_content_to_aws
    s3 = Aws::S3::Resource.new
    bucket = s3.bucket(ENV.fetch("PERSONAL_WEBSITE_BUCKET_NAME"))
    
    self.aws_obj_key = 'blog/' + self.title.gsub(" ", "-").downcase + '.md'
    
    object = bucket.object(self.aws_obj_key)
    
    object.put(body: self.content)
  end
  
  def fetch_content_from_aws
    s3 = Aws::S3::Resource.new
    bucket = s3.bucket(ENV.fetch("PERSONAL_WEBSITE_BUCKET_NAME"))
    
    object = bucket.object(self.aws_obj_key)
    
    self.content = object.get.body.string
  end
end
