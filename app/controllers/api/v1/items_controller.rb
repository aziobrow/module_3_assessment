class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def create
    Item.create(item_params)
  end

private
  def item_params
    params.permit(:name, :description, :image_url)
  end
end
