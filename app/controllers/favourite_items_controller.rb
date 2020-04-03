class FavouriteItemsController < ApplicationController
  before_action :set_favourite_item, only: [:show, :edit, :update, :destroy]

  # GET /favourite_items
  # GET /favourite_items.json
  def index
    @favourite_items = FavouriteItem.all
  end

  # GET /favourite_items/1
  # GET /favourite_items/1.json
  def show
  end

  # GET /favourite_items/new
  def new
    @favourite_item = FavouriteItem.new
  end

  # GET /favourite_items/1/edit
  def edit
  end

  # POST /favourite_items
  # POST /favourite_items.json
  def create
    @favourite_item = FavouriteItem.new(favourite_item_params)

    respond_to do |format|
      if @favourite_item.save
        format.html { redirect_to @favourite_item, notice: 'Favourite item was successfully created.' }
        format.json { render :show, status: :created, location: @favourite_item }
      else
        format.html { render :new }
        format.json { render json: @favourite_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favourite_items/1
  # PATCH/PUT /favourite_items/1.json
  def update
    respond_to do |format|
      if @favourite_item.update(favourite_item_params)
        format.html { redirect_to @favourite_item, notice: 'Favourite item was successfully updated.' }
        format.json { render :show, status: :ok, location: @favourite_item }
      else
        format.html { render :edit }
        format.json { render json: @favourite_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourite_items/1
  # DELETE /favourite_items/1.json
  def destroy
    @favourite_item.destroy
    respond_to do |format|
      format.html { redirect_to favourite_items_url, notice: 'Favourite item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite_item
      @favourite_item = FavouriteItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favourite_item_params
      params.require(:favourite_item).permit(:favourite_id, :product_id, :product_item_id)
    end
end
