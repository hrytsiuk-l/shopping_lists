class ItemsController < ApplicationController
  before_action :get_list
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = @list.items.new
  end

  def index
    @items = @list.items
  end

  def show
    @item = Item.find_by(uid: item_params[:uid] )
  end

  def edit
    @list = List.find(params[:list_id])
  end

  def create
    @item = @list.items.build(item_params)

    respond_to do |format|
     if @item.save
        format.html { redirect_to list_items_path(@list), notice: 'item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
     else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to list_item_path(@list), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to list_items_path(@list), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def get_list
    @list = List.find(params[:list_id])
  end

  def set_item
    @item = @list.items.find_by(uid: params[:uid])
  end

  def item_params
    params.permit(:uid, :name, :price, :list_id)
  end
end
