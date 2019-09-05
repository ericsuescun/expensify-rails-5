class Expense < ApplicationRecord
	enum extype: { purchase: 0, withdrawal: 1, transfer: 2, payment: 3, check: 4, credit_card1: 5, credit_card2: 6, credit_card3: 7  }
	enum category: { restaurant: 0, car: 1, food: 2, travel: 3, internet: 4, education: 5, services: 6, fun: 7 }
end
