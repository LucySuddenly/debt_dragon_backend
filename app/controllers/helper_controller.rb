class HelperController < ApplicationController

  def selectPlan
    user = User.find_by(params[:id])
    debts = Debts.find_by(user_id: user.id)
    render json: threePlans(user)
  end  
end
