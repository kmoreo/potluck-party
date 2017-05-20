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

  def signed_up
    potluck = Potluck.find_by(id: params[:id])
    if current_user.attended_potlucks
      current_user.attended_potlucks.each do |potluck_to_be_attended|
        if potluck_to_be_attended.potluck_id == potluck.id && potluck_to_be_attended.valid?
          return potluck_to_be_attended
        end
      end
    end
    return false
  end

end
