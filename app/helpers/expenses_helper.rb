module ExpensesHelper
	def removeparam(a,b)
		return a.gsub(b,'')
	end

	def extypeCapitalized
		str = Expense.extypes.keys
		strc = []
		str.each do |n|
			strc << n.capitalize
		end
		return strc
	end

	def categoryCapitalized
		str = Expense.categories.keys
		strc = []
		str.each do |n|
			strc << n.capitalize
		end
		return strc
	end
end
