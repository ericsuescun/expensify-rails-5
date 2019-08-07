class ExpensesController < ApplicationController
  def index
    @tab = :expenses
    date_range = Date.today.beginning_of_month..Date.today.end_of_month
    @expensesNow = Expense.where(:exdate =>  date_range)
    @expenses = Expense.all

    respond_to do |format|
      format.html
      format.js
      format.json { render :json => @expenses }
    end

  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expense_params)
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update(expense_params)
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
  end

  private
  	def expense_params
  		params.require(:expense).permit(:extype, :exdate, :concept, :category, :amount)
  	end

end
