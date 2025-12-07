class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include AuthenticationHelper
  helper_method :current_user, :logged_in?
  before_action :require_login

  private
  def require_login
    unless logged_in?
      flash[:alert] = 'Для доступа необходимо войти в систему'
      redirect_to login_path
    end
  end
end
