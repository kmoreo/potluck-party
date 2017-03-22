get '/sessions/new' do
  erb :'sessions/new'
end

get '/logout' do
  erb :'sessions/logout'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/"
    else
      @errors = ["Please enter a valid email and/or password."]
      erb :"sessions/new"
    end
end

delete '/sessions' do
  session.clear
  redirect '/'
end
