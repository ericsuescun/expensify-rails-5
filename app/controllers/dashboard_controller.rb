class DashboardController < ApplicationController
  def index
    @tab = :dashboard

    if params[:year].blank? && params[:month].blank?
	    @acc_today = Expense.where({ exdate: Date.today }).sum(:amount)
	    @acc_yest = Expense.where({ exdate: (Date.today - 1.day) }).sum(:amount)
	    @acc_month = Expense.where({exdate: (Date.today.beginning_of_month)..(Date.today.end_of_month)}).sum(:amount)
	    @acc_lmonth = Expense.where({exdate: (Date.today.beginning_of_month - 1.month)..(Date.today.end_of_month - 1.month)}).sum(:amount)
	else
		date_range = (Date.new(params[:year].to_i,params[:month].to_i,1).beginning_of_month..Date.new(params[:year].to_i,params[:month].to_i,1).end_of_month)
		ldate_range = ((Date.new(params[:year].to_i,params[:month].to_i,1).beginning_of_month - 1.month)..(Date.new(params[:year].to_i,params[:month].to_i,1).end_of_month) - 1.month)

		@acc_today = Expense.where({ exdate: Date.today }).sum(:amount)
		@acc_yest = Expense.where({ exdate: (Date.today - 1.day) }).sum(:amount)
		@acc_month = Expense.where( { exdate: date_range } ).sum(:amount)
		@acc_lmonth = Expense.where( { exdate: ldate_range } ).sum(:amount)
	end
  end
end
