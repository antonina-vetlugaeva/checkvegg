class ApplicationController < ActionController::Base

  def set_favourite
    @favourite = User.fiest.favourites.last
  end
end
