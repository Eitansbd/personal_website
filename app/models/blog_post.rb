class BlogPost < ApplicationRecord
  attr_accessor :content
  
  has_attached_file :title_image, styles: {
    square: '200x200#',
    medium: '250x140'
  }
  
  validates :title, presence: true
  validates :subtitle, presence: true
  validates :aws_obj_key, presence: true
  validates_attachment_content_type :title_image, :content_type => /\Aimage\/.*\Z/
  
  
  before_destroy :remove_files_from_aws
  
  def save_content_to_aws
    self.aws_obj_key = 'blog/' + self.title.gsub(" ", "-").downcase + '.md'
    
    object = fetch_s3_object
    
    object.put(body: self.content)
  end
  
  def fetch_content_from_aws
    object =  fetch_s3_object
    
    self.content = object.get.body.string
  end
  
  private
    def remove_files_from_aws
      object = fetch_s3_object
      
      object.delete
    end
    
    def fetch_s3_object
      s3 = Aws::S3::Resource.new
      bucket = s3.bucket(ENV.fetch("PERSONAL_WEBSITE_BUCKET_NAME"))
      bucket.object(self.aws_obj_key)
    end
end
