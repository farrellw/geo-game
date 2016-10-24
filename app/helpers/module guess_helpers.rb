module GuessHelper
# helpers do
  def current_game
    @game = @game || Game.find_by(id: params[:game_id].to_i)
  end

  def correct_guess(lat_guess, long_guess)
    @country = current_game.country
    lat_guess_min = @country.latitude - 10
    lat_guess_max = @country.latitude + 10
    long_guess_min = @country.longitude - 10
    long_guess_max = @country.longitude + 10
    if lat_guess <= lat_guess_min || lat_guess >= lat_guess_max
      return false
    elsif long_guess <= long_guess_min || long_guess >= long_guess_max
      return false
    else
      return true
    end
  end

  def boolean_to_string(boolean)
    return "Incorrect" if boolean == false
    return "Correct" if boolean == true
  end

end

helpers GuessHelper
