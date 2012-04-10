class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
  rescue_from ActiveRecord::RecordNotFound, :with => :redirect_home
  rescue_from ActionController::RoutingError, :with => :render_404

  private

  def redirect_home
    # 404
    redirect_to root_path, :notice => "Record not found"
  end

  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404: #{exception.message}"
    end

    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
end
