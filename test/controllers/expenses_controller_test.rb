require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
	test "Should get Expenses" do
		get '/expenses_path'
		assert_response :success
		assert_not_nil assigns(:expenses)
	end
end
