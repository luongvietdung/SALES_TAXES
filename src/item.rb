require File.expand_path(File.join(__FILE__, '..', 'sales_tax'))
require File.expand_path(File.join(__FILE__, '..', 'imported_tax'))
require File.expand_path(File.join(__FILE__, '..', 'util'))
require File.expand_path(File.join(__FILE__, '..', 'item_decorator'))

class Item
  attr_reader :product, :price, :imported, :exempted, :quantity

	def initialize args
		@product = args["product"]
		@price = args["price"].to_f
		@imported = Util.imported?(product)
		@exempted = Util.exempted?(product)
		@quantity = args["quantity"].to_i
	end

	def exempted?
		!!exempted
	end

	def imported?
	 !!imported
	end

	def tax
		@tax ||= calculate_tax
	end

	def price_included_tax
		price + tax
	end

	def decorate
		ItemDecorator.new(self)
	end

	private
	def calculate_tax
		tax = 0
		tax += SalesTax.calculate(price) unless exempted?
		tax += ImportedTax.calculate(price) if imported?
		round_of_tax tax
	end

	def round_of_tax tax
		(tax * 20).ceil / 20.0
	end

end