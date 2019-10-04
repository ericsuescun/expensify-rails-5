class Expense < ApplicationRecord
	validates :concept, :amount, :exdate, presence: true
	validates :amount, numericality: { only_integer: true }

	enum extype: { Purchase: 0, Withdrawal: 1, Transfer: 2,Payment: 3, Check: 4, Credit_card1: 5, Credit_card2: 6, Credit_card3: 7  }
	enum category: { Restaurant: 0, Car: 1, Food: 2, Travel: 3, Internet: 4, Education: 5, Services: 6, Fun: 7 }
end
