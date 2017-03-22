helpers do

  def current_user
    @_current ||= User.find_by(id: session[:user_id]) if logged_in?
  end

  def logged_in?
    !!session[:user_id]
  end

  def authorize_to_view(user_id)
    if current_user.id != user_id
      redirect "/users/#{current_user.id}"
    end
  end
  
  def redirect_home
     redirect '/' if !logged_in?
  end

  def event_date(datetime)
    datetime.strftime("%A %B %e, %Y")
  end

  def event_time(datetime)
    datetime.strftime("%l:%M %P")
  end

end