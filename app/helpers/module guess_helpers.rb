module GuessHelper
# helpers do
  def current_game
    @game = @game || Game.find_by(id: params[:game_id].to_i)
  end

  def correct_guess(lat_guess, long_guess)
    locatable = current_game.locatable
    lat_guess_min = locatable.latitude - 10
    lat_guess_max = locatable.latitude + 10
    long_guess_min = locatable.longitude - 10
    long_guess_max = locatable.longitude + 10
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
