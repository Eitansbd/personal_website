require 'rouge'

module BlogPostsHelper
  # class CustomRender < Redcarpet::Render::HTML
  #   include Rouge::Plugins::Redcarpet
  # end
  
  def render_markdown(text)
    extras = {
       autolink: true,
       no_intra_emphasis: true,
       disable_indented_code_blocks: true,
       fenced_code_blocks: true,
       strikethrough: true,
       superscript: true,
       lax_spacing: true
     }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    #markdown = Redcarpet::Markdown.new(CustomRender, extras)
    markdown.render(text).html_safe
  end
end
