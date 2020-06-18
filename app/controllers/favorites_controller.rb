class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product!

  private

  def find_product!
    @product = Product.find_by_id(params[:product_id])
  end

  def index
    @products = @products.favorited_by(params[:favorited]) if params[:favorited].present?
  end

  def create
    current_user.favorite(@product)

    render 'products/show'
  end

  def destroy
    current_user.unfavorite(@product)

    render 'products/show'
  end
end
