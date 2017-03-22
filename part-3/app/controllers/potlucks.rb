get '/potlucks' do
  @potlucks = Potluck.all.order(start_time: :ASC)
  erb :index
end

get '/potlucks/new' do
  if current_user
    erb :'/potlucks/new'
  else
    @potlucks = Potluck.all.order(start_time: :ASC)
    @errors = ["you must be logged in to add a potluck"]
    erb :index
  end
end

get '/potlucks/:id' do
  @potluck = Potluck.find_by(id: params[:id])
  @attendings = Attending.find_by(potluck_id: @potluck.id)
  erb :'potlucks/show'
end

get '/potlucks/:id/edit' do
  @potluck = Potluck.find_by(id: params[:id])
  if @potluck && current_user && @potluck.organizer_id == current_user.id
    erb :"potlucks/edit"
  else
    @errors = ["you are not authorized to perform this function"]
    erb :'potlucks/show'
  end
end

post '/potlucks' do
  @potluck = current_user.organized_potlucks.new(params[:potluck])
  if @potluck.save
    redirect "/potlucks/#{@potluck.id}"
  else
    @errors = @potluck.errors.full_messages
    erb :'/potlucks/new'
  end
end

post '/potlucks/:id/attendings' do
  attending = current_user.attended_potlucks.new(params[:attending])
  attending.potluck_id = params[:id]
  attending.save
  redirect "/potlucks/#{attending.potluck_id}"
end

put "/potlucks/:id" do
  @potluck = Potluck.find_by(id: params[:id])
  @potluck.assign_attributes(params[:potluck])
  if @potluck.save
    redirect "/potlucks/#{@potluck.id}"
  else
    @errors = @potluck.errors.full_messages
    erb :"potlucks/edit"
  end
end

delete "/potlucks/:id" do
  @potluck = Potluck.find_by(id: params[:id])
  @potluck.destroy
  redirect "/"
end
