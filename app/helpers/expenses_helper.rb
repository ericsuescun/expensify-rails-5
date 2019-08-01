module ExpensesHelper
end



module TombsHelper
	def productsList
		@ptypes = []
		@products.each do |product|
		  @ptypes << [ product.name, product.name ]
		end
		@ptypes
	end

	def entitiesList
		@etypes = []
		@entities.each do |entity|
		  @etypes << [entity.name, entity.name]
		end
		@etypes
	end
end