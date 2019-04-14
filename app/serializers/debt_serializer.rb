class DebtSerializer < ActiveModel::Serializer
  attributes :id, :debt_type, :amount, :interest_rate, :min_payment, :user_id
  belongs_to :user
end
