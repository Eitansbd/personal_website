class BlogPostsController < ApplicationController
  before_action :load_blog_post, only: [:show, :edit, :destroy, 
                                        :update]
  before_action :require_admin_login, only: [:new, :create, :edit, :destroy, :unpublished, :toggle]
  
  def index
    @blog_posts = BlogPost.where(published: true)
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
    @blog_post.fetch_content_from_aws
  end
  
  def edit
    @blog_post.fetch_content_from_aws
  end
  
  def update
    if @blog_post.update_attributes(blog_post_params)
      @blog_post.save_content_to_aws
      flash[:success] = "Post updated successfully"
      
      redirect_to @blog_post.published? ? blog_posts_url : blog_posts_unpublished_url
    else
      flash[:error] = @blog_post.errors.full_messages.first
      render 'edit'
    end
  end
  
  def destroy
    @blog_post.destroy
    
    redirect_to blog_posts_url
  end
  
  def unpublished
    @blog_posts = BlogPost.where(published: false)
    
  end
  
  def toggle
    @blog_post = BlogPost.find(params[:blog_post_id])
    @blog_post.toggle!(:published)
    
    redirect_to @blog_post.published? ? blog_posts_url : blog_posts_unpublished_url
  end
  
  private
    
    def blog_post_params
      params.require(:blog_post).permit(:title, :subtitle, :content, :title_image, :published)
    end
    
    def load_blog_post
      @blog_post = BlogPost.find(params[:id])
    end
    
    def require_admin_login
      redirect_to root_url unless session[:admin] == 1
    end
end
