class Expense < ApplicationRecord
	enum extype: { purchase: 0, withdrawal: 1 }
	enum category: { restaurant: 0, car: 1 }
end
