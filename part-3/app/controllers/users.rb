get '/users/new' do
 erb :'/users/new'
end

get '/users/:id' do
  redirect_home
  @user = User.find_by(id: params[:id])
  authorize_to_view(@user.id) if @user
  # @reviews = @user.reviews
  erb :'users/show'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end
