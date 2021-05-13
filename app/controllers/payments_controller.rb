class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @payment_address = PaymentAddress.new
    unless @item.payment == nil
      redirect_to root_path
    end
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @payment_address = PaymentAddress.new(payment_params)
    if @payment_address.valid?
      pay_item
      @payment_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def payment_params
    params.require(:payment_address).permit(:postal_code, :prefecture_id, :manicipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: payment_params[:token],
      currency: 'jpy'
    )
  end
end
