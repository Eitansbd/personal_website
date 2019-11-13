class AddTitleImageToBlogPost < ActiveRecord::Migration[5.2]
  def self.up
    add_attachment :blog_posts, :title_image
  end

  def self.down
    remove_attachment :blog_posts, :title_image
  end
end
