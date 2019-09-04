class DashboardController < ApplicationController
  def index
    @tab = :dashboard

    @acc_today = Expense.where({ exdate: Date.today }).sum(:amount)

    @acc_yest = Expense.where({ exdate: (Date.today - 1.day) }).sum(:amount)

    @acc_month = Expense.where({exdate: (Date.today.beginning_of_month)..(Date.today.end_of_month)}).sum(:amount)
    @acc_lmonth = Expense.where({exdate: (Date.today.beginning_of_month - 1.month)..(Date.today.end_of_month - 1.month)}).sum(:amount)
  end
end
