class User < ApplicationRecord
  has_many :debts
  has_one :plan
end
