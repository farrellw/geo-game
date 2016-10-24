get '/games/new' do
  erb :'games/new'
end

post '/games' do
  country = Country.find_by(id: rand(1..236))
  @game = Game.create(user_id: current_user.id, country_id: country.id, difficulty: params[:difficulty].to_i)
  redirect to("/games/#{@game.id}")
end

post '/maps' do
  @longitude = params[:longitude] || 0
  @latitude = params[:latitude] || 0
end

get '/games/:game_id/winner' do
  @game = current_game
  @country = @game.country
  @guesses = @game.guesses
  erb :'games/game_winner'
end

get '/games/:game_id/loser' do
  @game = current_game
  @guesses = @game.guesses
  erb :'games/game_winner'
end

get '/games/:game_id' do
  @game = current_game
  if @game != nil
    @last_guess = @game.guesses[-1] if @game.guesses.length != 0
    if @game.guesses.length < @game.difficulty
      erb :'games/show'
    else
      @country = @game.country
      @guesses = @game.guesses
      erb :'games/game_loser'
    end
  else
    redirect to('/')
  end
end

post '/games/:game_id/guess' do
  @game = current_game
  @correct = correct_guess(params[:latitude].to_i, params[:longitude].to_i)
  @guess = Guess.create(user_id: session[:user_id], game_id: @game.id, lat_guess: params[:latitude], long_guess: params[:longitude], correct_or_false: @correct)
  redirect to("/games/#{@game.id}") if @correct == false
  redirect to("/games/#{@game.id}/winner")
end

get '/games/:game_id/*' do
  redirect to('/')
end