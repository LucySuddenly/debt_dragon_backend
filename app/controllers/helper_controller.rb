class HelperController < ApplicationController

  def selectPlan
    byebug
    user = User.find_by(user_id: params[:user_id])
    debts = Debt.find_by(user_id: user.id)
    render json: threePlans(user)
  end  

  def returnPlan
    user = User.find_by(params[:id])
    if user.plan.name == "avalanche" 
      returnValue = generatePlan(avalanche(user), user)
    elsif user.plan.name == "Snowball" 
      returnValue = generatePlan(snowball(user), user)
    elsif user.plan.name == "credit"
      returnValue = generatePlan(credit(user), users)
    end
    render json: returnValue
  end
end
