module UserHelper
# helpers do
  def current_user
    @user = @user || User.find_by(id: session[:user_id])
  end

  def logged_in?
    session[:user_id] != nil
  end

  def access_allowed?(page_id)
    logged_in? && current_user.id == page_id
  end

end

helpers UserHelper
