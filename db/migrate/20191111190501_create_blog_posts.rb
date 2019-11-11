class CreateBlogPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_posts do |t|
      t.text :title
      t.text :subtitle
      t.text :aws_obj_key

      t.timestamps
    end
  end
end
