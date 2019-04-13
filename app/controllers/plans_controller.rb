class PlansController < ApplicationController
  def create
  plan = Plan.create(plan_params(params))
  render json: plan
  end

  def show
  plan = Plan.find(params[:id])
  render json: plan
  end

  private 

  def plan_params(params) 
    params.require(:plan).permit(:user_id, :name)
  end
  
end
