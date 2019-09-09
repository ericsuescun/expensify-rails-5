require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest

	setup do
		@expense = expenses(:one)	#Definido en los fixtures
	end

	test "Should get Expenses index" do
		get expenses_path
		assert_response :success
		assert_not_nil assigns(:expenses)
	end

	test "Should get Expenes by month" do
		get expenses_path, {params: {month: 3, year: 2019}}
		assert_response :success
		assert_not_nil assigns(:expenses)
	end

	test "Should create an expense" do
		assert_difference "Expense.count", 1 do
			post "/expenses", params: { expense: { extype: @expense.extype, category: @expense.category, concept: @expense.concept, exdate: @expense.exdate, amount: @expense.amount }, format: 'js' } #Uso los fixtures
		end
	end

end
