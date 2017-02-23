class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    item = Item.find(params[:id])
    render :json => item, :except => [:created_at, :updated_at]
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render :json => item, :status => 204
  end

  def create
    item = Item.create(item_params)
    render :json => item, :except => [:created_at, :updated_at], :status => 201
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end

end
