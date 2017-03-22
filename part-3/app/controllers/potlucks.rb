get '/potlucks' do
  @potlucks = Potluck.all.order(start_time: :ASC)
  erb :index
end

get '/potlucks/new' do
 erb :'/potlucks/new'
end

get '/potlucks/:id' do
  @potluck = Potluck.find_by(id: params[:id])
  erb :'potlucks/show'
end

get '/potlucks/:id/edit' do
  @potluck = Potluck.find_by(id: params[:id])
  if @potluck && @potluck.organizer_id == current_user.id
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
