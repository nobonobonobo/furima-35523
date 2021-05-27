class FurimasController < ApplicationController
  def index
    #@furimas = Furima.all
  end

  private

  def furima_params
    params.require(:furima).permit(:content, :image).merge(user_id: current_user.id)
  end
end
