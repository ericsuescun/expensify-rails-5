class ExpensesController < ApplicationController
  
  def index
    @tab = :expenses
    if params[:year].blank? && params[:month].blank?
      params[:year] = Date.today.year
      params[:month] = Date.today.month
    end
    date_range = Date.new(params[:year].to_i,params[:month].to_i,1).beginning_of_month..Date.new(params[:year].to_i,params[:month].to_i,1).end_of_month

    @expenses = Expense.where(:exdate =>  date_range).order('exdate DESC')
    # @expenses = Expense.order('exdate DESC')
    respond_to do |format|
      format.html
      format.js
      format.json { render :json => @expenses.order('exdate DESC') }
    end

  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expense_params)
    respond_to do |format|
      format.js
    end
  end

  def edit
    @expense = Expense.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update(expense_params)
    respond_to do |format|
      format.js
      redirect_to expenses_path
    end
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
