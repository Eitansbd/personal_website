class SessionsController < ApplicationController
  def new
  end
  
  def create
    if params[:admin_password] == ENV['ADMIN_PASSWORD']
      session[:admin] = 1
      flash[:success] = "Logged in as Admin"
      
      redirect_to blog_posts_url
    else
      flash.now[:error] = "Incorrect Password. If you are not the admin, don't try logging in"
    end
  end
  
  def destroy
    session.delete(:admin)
    
    redirect_to root_url
  end
end
