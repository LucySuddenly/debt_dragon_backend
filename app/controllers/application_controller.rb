class ApplicationController < ActionController::API


  def snowball(user)
    debts = Debt.find_by(user_id: user.id)
    debts.sort_by! { |debt| debt.amount }
  end

  def avalanche(user)
    debts = Debt.find_by(user_id: user.id)
    debts.sort_by! { |debt| debt.amount }
    debts.reverse
  end

  def credit(user)
    debts = Debt.find_by(user_id: user.id)
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
      while debts.length > 0 
        returnHash = {}
        mpr = debts.first.interest_rate / 12
        min_total = 0
        debts.each do |debt|
          min_total += debt.min_payment
        end
        targetPayment = user.income - min_total + debts.first.min_payment
        months = monthsTillPayoff(debts.first.amount, targetPayment, mpr)
        returnHash["targetPayment"] = targetPayment
        returnHash["months"] = months 
        returnHash["amount"] = debts.first.amount
        returnHash["name"] = debts.first.name
        returnHash["debt_type"] = debts.first.debt_type
        returnHash["mpr"] = mpr
        returnArray.push(returnHash)
        debts.shift
        generatePlan(debts, user)
      end
      returnArray
    end
  end

  def threePlans(user)
    plans = {}
    snowballDebts = snowball(user)
    avalancheDebts = avalanche(user)
    creditDebts = credit(user)
    plans["avalanche"] = generatePlan(avalancheDebts(user), user)
    plans["snowball"] = generatePlan(snowballDebts(user), user)
    plans["credit"] = generatePlan(creditDebts(user), user)
    plans
  end
end
