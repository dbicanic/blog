class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_blog_settings

  def get_blog_settings
  	@blog_title = Preferences::Blog::Blog_title
  end
end
