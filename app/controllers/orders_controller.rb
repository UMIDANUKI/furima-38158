class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :sold?, only:[:index]

  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:post_code, :prefectures_id, :municipalities, :address,
                                     :buildings, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    @item = Item.find(purchase_params[:item_id])
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def sold?
    @item = Item.find(params[:item_id])
    if @item.order.present? || @item.user == current_user
      redirect_to root_path
    end
  end

end
