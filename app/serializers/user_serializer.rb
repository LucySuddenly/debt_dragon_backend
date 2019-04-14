class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :expenses, :income
  has_many :debts
  has_one :plan
end
