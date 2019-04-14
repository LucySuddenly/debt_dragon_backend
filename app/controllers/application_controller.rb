class ApplicationController < ActionController::API


  def snowball(user)
    debts = Debt.all
    debts = debts.select{|debt| debt.user_id == user.id}
    debts.sort_by! { |debt| debt.amount }

  end

  def credit(user)
    debts = Debt.all
    debts = debts.select{|debt| debt.user_id == user.id}
    debts.sort_by! { |debt| debt.amount }
    debts.reverse
  end

  def avalanche(user)
    debts = Debt.all
    debts = debts.select{|debt| debt.user_id == user.id}
    debts.sort_by! { |debt| debt.interest_rate }
  end

  def monthsTillPayoff(amount, targetPayment, mpr)
      months = 0
      while amount > 0
        amount -= (targetPayment - (amount * mpr))
        months += 1
      end
      return months
    end

  def generatePlan(debts, user)
      returnArray = []
      returnHash = {}
       debts.length.times do
        returnHash.clear
        mpr = debts.first.interest_rate / 1200
        min_total = 0
        debts.each do |debt|
          min_total += debt.min_payment
        end
        targetPayment = user.income - user.expenses - min_total + debts.first.min_payment
        months = monthsTillPayoff(debts.first.amount, targetPayment, mpr)
        returnHash["targetPayment"] = targetPayment
        returnHash["months"] = months
        returnHash["amount"] = debts.first.amount
        returnHash["debt_type"] = debts.first.debt_type
        returnHash["mpr"] = mpr
        newReturnHash = returnHash.clone
        returnArray.insert(-1, newReturnHash)
        debts.shift
      end
      returnArray
  end

  def threePlans(user)
    plans = {}
    snowballDebts = snowball(user)
    avalancheDebts = avalanche(user)
    creditDebts = credit(user)
    plans["avalanche"] = generatePlan(avalancheDebts, user)
    plans["snowball"] = generatePlan(snowballDebts, user)
    plans["credit"] = generatePlan(creditDebts, user)
    plans
  end
end
