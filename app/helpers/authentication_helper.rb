module AuthenticationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:session_id]) if session[:session_id]
  end

  def logged_in?
    current_user.present?
  end
end