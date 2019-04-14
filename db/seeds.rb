# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "Sky", last_name: "Moon", username: "sunshine2000", expenses: 1600, income: 5000)
Debt.create(debt_type: "Credit Card", amount: 2000, interest_rate: 19.5, user_id: 1, min_payment: 80)
Plan.create(user_id: 1, name: "Snowball")

Debt.create(debt_type: "Home Loan", amount: 22000, interest_rate: 9.5, user_id: 1, min_payment: 1200)
Debt.create(debt_type: "Credit Card", amount: 8000, interest_rate: 24, user_id: 1, min_payment: 100)
Debt.create(debt_type: "Car", amount: 16000, interest_rate: 6, user_id: 1, min_payment: 280)
Debt.create(debt_type: "Student Loan", amount: 50000, interest_rate: 4.5, user_id: 1, min_payment: 150)