class DebtSerializer < ActiveModel::Serializer
  attributes :id, :type, :amount, :interest_rate, :min_payment, :user_id
  belongs_to :user
end
