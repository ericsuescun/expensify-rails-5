require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest

	setup do
		@expense = expenses(:one)	#Definido en los fixtures
	end

	test "Should get actual date Expenses index (whit no params at all)" do
		get expenses_path
		assert_response :success
		assert_not_nil assigns(:expenses)
		#assert_select "button#dateFilter", "#{Date.today.strftime('%B')} #{Date.today.year}" #Check for month button
		#assert_select "li, a", "#{(Date.today - 12.months).strftime('%B')} #{(Date.today - 12.months).year}"	#Check for the entire year dropdown
	end

	test "Should get Expenses by any month and year in HTML" do
		m = rand(1..12)
		y = rand(1975..2075)
		date = DateTime.new(y, m, 1)
		get expenses_path, {params: {month: m, year: y}}
		assert_response :success
		assert_not_nil assigns(:expenses)
		#assert_select "button#dateFilter", "#{date.strftime('%B')} #{date.year}" #Check for month button
		#assert_select "li, a", "#{(date - 12.months).strftime('%B')} #{(date - 12.months).year}"	#Check for the entire year dropdown
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

	test "Should get Expenses by month and year in JSON" do
		get expenses_path, params: { expense: {month: 3, year: 2019, format: 'json' }}, xhr: true
		assert_response :success
		assert_not_nil assigns(:expenses)
	end

	test "Should get Expenses by month, year and extype in JSON" do
		get expenses_path, params: { expense: {month: 3, year: 2019, extype: 0, format: 'json' }}, xhr: true
		assert_response :success
		assert_not_nil assigns(:expenses)
	end

	test "Should get Expenses by month, year and category in JSON" do
		get expenses_path, params: { expense: {month: 3, year: 2019, category: 0, format: 'json' }}, xhr: true
		assert_response :success
		assert_not_nil assigns(:expenses)
	end

	test "Should get Expenses by month, year, category and extype in JSON" do
		get expenses_path, params: { expense: {month: 3, year: 2019, extype: 0, category: 0, format: 'json' }}, xhr: true
		assert_response :success
		assert_not_nil assigns(:expenses)
	end


end
