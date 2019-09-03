module DashboardHelper
	def monthly_data
		date_range = Date.today.beginning_of_month..Date.today
    	@expenses = Expense.where({:exdate => date_range, :extype => 'purchase' })

    	@data = [ ]
    	
    	(0..5).each do |m|
    		row = {}
    		row[:x] = (Date.today - (5-m).month).end_of_month.strftime('%b')
    		Expense.extypes.each do |extype, n|
    			row[extype.to_s] = Expense.where({exdate: (Date.today.beginning_of_month - (5-m).month)..(Date.today.end_of_month - (5-m).month), extype: extype }).sum(:amount)
    		end
    		@data.push(row)
    	end
    	return @data
	end
end


