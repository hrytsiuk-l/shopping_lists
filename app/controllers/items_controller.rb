class ItemsController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @list.items << Item.new
  end

  def index
    @list = List.find(params[:list_id])
    @list.items
  end

  def show
    @item = Item.find_by(uid: item_params[:uid] )
  end

  def edit
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.create(item_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find_by(uid: item_params[:uid])
    @item.destroy
    redirect_to list_items_path(@list)
  end

  private

  def item_params
    (params).permit(:uid, :name, :price, :list_id)
  end
end
