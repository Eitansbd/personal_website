class BlogPost < ApplicationRecord
  attr_accessor :content
  
  validates :title, presence: true
  validates :subtitle, presence: true
  validates :aws_obj_key, presence: true
  
  
end
