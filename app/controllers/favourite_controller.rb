class FavouriteController < ApplicationController
  def create
    @favproducts =current_user.favorites.create(params[:user_id])
  end
end
