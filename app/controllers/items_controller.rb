class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]
  before_action :find_item, only: [:show, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if @item.user == current_user
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :image, :price, :category_id, :status_id, :delivery_charge_id, :prefectures_id,
                                 :time_required_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    if current_user != @item.user || @item.order.present?
      redirect_to root_path
    end
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
