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

post '/potlucks' do
  @potluck = current_user.organized_potlucks.new(params[:potluck])
  if @potluck.save
    redirect "/potlucks/#{@potluck.id}"
  else
    @errors = @potluck.errors.full_messages
    erb :'/potlucks/new'
  end
end
