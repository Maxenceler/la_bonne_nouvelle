class ApplicationController < ActionController::Base

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    projects_path
  end

  def after_sign_up_path_for(resource)
    projects_path
  end

end
