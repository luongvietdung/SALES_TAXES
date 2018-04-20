require File.expand_path(File.join(__FILE__, '..', 'item'))
require File.expand_path(File.join(__FILE__, '..', 'cart_decorator'))

class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_to_cart(item)
    items << item
  end

  def total_price
    @total_price ||= items.map(&:price_included_tax).reduce(:+)
  end

  def total_tax
    @total_tax ||= items.map(&:tax).reduce(:+)
  end

  def decorate
    CartDecorator.new(self)
  end

end
