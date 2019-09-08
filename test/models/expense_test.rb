require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase

	test "Expense should have concept" do
		@expense = Expense.new(exdate: Date.today, amount: 10000)
		assert_not @expense.save
	end

	test "Expense should have a date" do
		@expense = Expense.new(concept: 'Test', amount: 10000)
		assert_not @expense.save
	end

	test "Expense should have an amount" do
		@expense = Expense.new(concept: 'Test', exdate: Date.today)
		assert_not @expense.save
	end

	test "Expense amount should be integer" do
		@expense = Expense.new(concept: 'Test', exdate: Date.today, amount: 1.5)
		assert_not @expense.save
	end

end
