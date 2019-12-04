class AddPathToBlogPost < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :path, :text
  end
end
