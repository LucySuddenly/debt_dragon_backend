class DebtsController < ApplicationController
  def create
  debt = Debt.create(debt_params(params))
  render json: debt
  end

  def show
  debt = Debt.find(params[:id])
  render json: debt
  end

  private 

  def debt_params(params) 
    params.require(:debt).permit(:type, :amount, :interest_rate, :user_id, :min_payment)
  end
end
