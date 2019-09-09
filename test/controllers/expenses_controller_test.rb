require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest

	setup do
		@expense = expenses(:one)	#Definido en los fixtures
	end

	test "Should get Expenses index whit no params at all" do
		get expenses_path
		assert_response :success
		assert_not_nil assigns(:expenses)
	end

	test "Should get Expenses by month and year in HTML" do
		get expenses_path, {params: {month: 3, year: 2019}}
		assert_response :success
		assert_not_nil assigns(:expenses)
	end

	test "Should get Expenses by month, year and extype in HTML" do
		get expenses_path, {params: {month: 3, year: 2019, extype: 0}}
		assert_response :success
		assert_not_nil assigns(:expenses)
	end

	test "Should get Expenses by month, year and category in HTML" do
		get expenses_path, {params: {month: 3, year: 2019, category: 0}}
		assert_response :success
		assert_not_nil assigns(:expenses)
	end

	test "Should get Expenses by month, year, category and extype in HTML" do
		get expenses_path, {params: {month: 3, year: 2019, extype: 0, category: 0}}
		assert_response :success
		assert_not_nil assigns(:expenses)
	end

	test "Should get Expenses by month and year in JS" do
		get expenses_path, params: { expense: {month: 3, year: 2019, format: 'js' }}, xhr: true
		assert_response :success
		assert_not_nil assigns(:expenses)
	end

	test "Should get Expenses by month, year and extype in JS" do
		get expenses_path, params: { expense: {month: 3, year: 2019, extype: 0, format: 'js' }}, xhr: true
		assert_response :success
		assert_not_nil assigns(:expenses)
	end

	test "Should get Expenses by month, year and category in JS" do
		get expenses_path, params: { expense: {month: 3, year: 2019, category: 0, format: 'js' }}, xhr: true
		assert_response :success
		assert_not_nil assigns(:expenses)
	end

	test "Should get Expenses by month, year, category and extype in JS" do
		get expenses_path, params: { expense: {month: 3, year: 2019, extype: 0, category: 0, format: 'js' }}, xhr: true
		assert_response :success
		assert_not_nil assigns(:expenses)
	end

	test "Should create an expense" do
		assert_difference "Expense.count", 1 do
			post "/expenses", params: { expense: { extype: @expense.extype, category: @expense.category, concept: @expense.concept, exdate: @expense.exdate, amount: @expense.amount }, format: 'js' } #Uso los fixtures
		end
	end

	test "should filter by extype" do
		get expenses_path, {params: {month: 3, year: 2019, extype: 1}}
		assert_response :success
		assert_not_nil assigns(:expenses)
	end

end
