class CreateDebts < ActiveRecord::Migration[5.2]
  def change
    create_table :debts do |t|
      t.string :debt_type
      t.integer :amount
      t.float :interest_rate
      t.float :min_payment
      t.integer :user_id

      t.timestamps
    end
  end
end
