require 'rouge/plugins/redcarpet'

module BlogPostsHelper
  
  
  def render_markdown(text)
    extras = {
       autolink: true,
       no_intra_emphasis: true,
       fenced_code_blocks: true,
       strikethrough: true,
       superscript: true,
       lax_spacing: true
     }
    
    markdown = Redcarpet::Markdown.new(CustomRender, extras)
    markdown.render(text).html_safe
  end
  
  def admin_logged_in?
    session[:admin] == 1
  end
  
  def post_date_format(date)
    date.strftime("%b %-d, %Y")
  end
  
  def opposite_of_published(blog_post) 
    blog_post.published? ? "Unpublish" : "Publish"
  end
  
  private
    class CustomRender < Redcarpet::Render::HTML
      include Rouge::Plugins::Redcarpet
    end
end
