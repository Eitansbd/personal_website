class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
    
    
  end
  
  def new
    @blog_post = BlogPost.new
  end
  
  def create
    @blog_post = BlogPost.new(blog_post_params)
    @blog_post.save_content_to_aws
    
    @blog_post.save
    
    redirect_to root_url
  end
  
  def show
    @blog_post = BlogPost.find(params[:id])
    
    @blog_post.fetch_content_from_aws
  end
  
  private
    
    def blog_post_params
      params.require(:blog_post).permit(:title, :subtitle, :content)
    end
end
