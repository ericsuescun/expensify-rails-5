require 'test_helper'
require 'capybara/dsl'

class Features2Test < ActionDispatch::IntegrationTest

	include Capybara::DSL

  setup do
    Capybara.current_driver = Capybara.javascript_driver # :selenium by default
  end

  test "Display all dashboards" do
  	visit root_path
  	page.has_content?("Últimos 6 Meses")
  	page.has_content?("Por Día")
  	page.has_content?("Por Categoría")
  	page.has_content?("Acumulado")
  end

  test "Display Expenses, Indicators and Filters views" do
	visit 'expenses?month=9&year=2019'
	page.has_content?("September 2019")
	page.has_content?("Total")
	page.has_content?("Transactions")
	page.has_content?("Average")
	page.has_content?("Transaction Type")
  end

  test "Display specific data in expenses list" do
	visit 'expenses?month=7&year=2019'
	page.has_content?("July 2019")
	page.has_content?("MyText")
	page.has_content?("1")
  end

  test "Displays actual month in month filter" do
	visit root_path
	click_link('Expenses')
	click_button(Date.today.strftime('%B') + ' ' + Date.today.year.to_s)
  end

  test "Can generate an expense" do
	visit root_path
	click_link('Expenses')
	click_link('New Expense')
	within("#new_expense") do
	  fill_in 'Concept', with: 'Test'
	  fill_in 'Amount', with: 10
	  click_button 'Create Expense'
	end
	page.has_content?("Test")
	page.has_content?("10")
	# within '#new_expense' do
	# 	fill_in 'concept', with: 'Test'
	# 	fill_in 'amount', with: 10
	# 	click_button '#submitButton'
	# end
	# page.must_have_content 'Test'
	# page.must_have_content '10'
  end

  # feature "Feature Tests" do


  #   scenario "Display all dashboards" do
  #       visit root_path
  #       page.must_have_content "Últimos 6 Meses"
  #       page.must_have_content "Por Día"
  #       page.must_have_content "Por Categoría"
  #       page.must_have_content "Acumulado"
  #     end

  #   scenario "Display Expenses, Indicators and Filters views" do
  #       visit 'expenses?month=9&year=2019'
  #       page.must_have_content "September 2019"
  #       page.must_have_content "Total"
  #       page.must_have_content "Transactions"
  #       page.must_have_content "Average"
  #       page.must_have_content "Transaction Type"
  #     end

  #   scenario "Display specific data in expenses list" do
  #       visit 'expenses?month=7&year=2019'
  #       page.must_have_content "July 2019"
  #       page.must_have_content "MyText"
  #       page.must_have_content "1"
  #     end

  #   scenario "Visit root, clicks on Expenses and must bring actual month in filters" do
  #       visit root_path
  #       click_link 'Expenses'
  #       click_button Date.today.strftime('%B') + ' ' + Date.today.year.to_s
  #     end

  #   scenario 'Can generate an Expense' do
  #   	visit root_path
  #   	click_link 'Expenses'
  #   	click_link 'New Expense'
  #   	# within '#new_expense' do
  #   	# 	fill_in 'concept', with: 'Test'
  #   	# 	fill_in 'amount', with: 10
  #   	# 	click_button '#submitButton'
  #   	# end
  #   	# page.must_have_content 'Test'
  #   	# page.must_have_content '10'
  #   end
  # end
end
