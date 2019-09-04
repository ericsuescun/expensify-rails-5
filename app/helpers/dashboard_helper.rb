module DashboardHelper
	def monthly_data
		date_range = Date.today.beginning_of_month..Date.today

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

		def daily_data
			# date_range = (Date.today.beginning_of_month - 1.month)..(Date.today.end_of_month - 1.month)
			date_range = (Date.today.beginning_of_month)..(Date.today.end_of_month)
	    	@expenses = Expense.where({:exdate => date_range, :extype => 'purchase' })

	    	@data = [ ]
	    	
	    	date_range.each do |d, n|
	    		row = {}
	    		row[:x] = d.strftime('%d')
	    		Expense.extypes.each do |extype, n|
	    			row[extype.to_s] = Expense.where({exdate: d, extype: extype }).sum(:amount)
	    		end
	    		@data.push(row)
	    	end
	    	return @data
		end

	def category_data
		# date_range = (Date.today.beginning_of_month - 5.month)..(Date.today.end_of_month)
		date_range = (Date.today.beginning_of_month)..(Date.today.end_of_month)
    	@data = [ ]
		Expense.categories.each do |category, n|
			row = {}
			row[:label] = category
			row[:value] = Expense.where({exdate: date_range, category: category }).sum(:amount)
			@data.push(row)
		end
    	return @data
	end

	def acc_data
		# date_range = (Date.today.beginning_of_month - 1.month)..(Date.today.end_of_month - 1.month)
		date_range = (Date.today.beginning_of_month)..(Date.today.end_of_month)
    	@data = [ ]
    	a = 0
    	b = 0
    	date_range.each do |d, n|
    		row = {}
    		row['x'] = d.strftime('%d')
    		a = a + Expense.where({ exdate: d }).sum(:amount)
    		b = b + Expense.where({ exdate: (d - 1.month) }).sum(:amount)
    		row['actual'] = a
    		row['last'] = b
    		@data.push(row)
    	end
    	return @data
	end
end


