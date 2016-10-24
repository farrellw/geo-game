get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user_object = User.new(params[:user_info])
  if user_object.save
    session[:user_id] = user_object.id
    redirect to("/")
  else
    user_object.valid?
    @errors = user_object.errors.full_messages
    erb :'users/new'
  end
end

get '/login' do
  erb :'users/login'
end

post '/login' do
  @user_object = User.find_by(username: params[:username])
  if @user_object != nil
    session[:user_id] = @user_object.id
    redirect to("/users/#{@user_object.id}")
  else
    @errors = ["You didn't enter a valid username"]
    erb :'users/login'
  end
end

delete '/logout' do
  session[:user_id] = nil
  redirect to('/')
end

get '/users/:id' do
  if access_allowed?(params[:id].to_i)
    @user_object = User.find_by(id: params[:id])
    @games_played = @user_object.games
    erb :'users/show'
  else
    redirect to('/')
  end
end

get '/users/:id/*' do
 redirect to('/')
end



get '/unauthorized' do
  erb :unauthorized
end
