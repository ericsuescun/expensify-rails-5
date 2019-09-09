require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest

  test "Should get Dashboard index whit no params at all" do
  	get dashboard_index_path
  	assert_response :success
  end

  test "Should get Dashboard with month and year in HTML" do
  	get dashboard_index_path, {params: {month: 3, year: 2019}}
  	assert_response :success
  end

end
