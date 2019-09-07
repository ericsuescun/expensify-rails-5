require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase

	test "Expense should have concept" do
		@expense = Expense.new
		assert_not @expense.save
	end

end
