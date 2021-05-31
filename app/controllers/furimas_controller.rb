class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  

  def index
    @furimas = Furima.order("created_at DESC")
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.new(furima_params)
    if @furima.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @furima = Furima.find(params[:id])
  end

  private

  def furima_params
    params.require(:furima).permit(:image, :name, :price, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
