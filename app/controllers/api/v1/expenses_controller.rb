module Api
	module V1
		class ExpensesController < ApplicationController
			protect_from_forgery with: :null_session
			respond_to :json

			def index
				if params[:year].blank? && params[:month].blank?
				  date_range = Date.today.beginning_of_month..Date.today.end_of_month
				else
				  date_range = Date.new(params[:year].to_i,params[:month].to_i,1).beginning_of_month..Date.new(params[:year].to_i,params[:month].to_i,1).end_of_month
				end
				expenses = Expense.where({:exdate => date_range }).order('exdate DESC')
				respond_with expenses
			end

			def show
				respond_with Expense.find(params[:id])
			end

			def create
				expense = Expense.new(expense_params)
				if expense.save
					respond_with expense
				else
					render json: { errors: expense.errors }, status: 422
				end
			end

			def update
				expense = Expense.find(params[:id])
				if expense.update(expense_params)
					respond_with expense
				else
					render json: { errors: expense.errors }, status: 422
				end
			end

			def destroy
				expense = Expense.find(params[:id])
				expense.destroy

				head :no_content
			end

			private
				def expense_params
					params.require(:expense).permit(:extype, :exdate, :concept, :category, :amount)
				end
		end
	end
end