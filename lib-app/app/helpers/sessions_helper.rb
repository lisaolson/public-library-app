module SessionsHelper
  def login(user)
    session[:user_id] = user.id
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
