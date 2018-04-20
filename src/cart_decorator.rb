require File.expand_path(File.join(__FILE__, '..', 'cart'))

class CartDecorator
  def initialize cart
    @cart = cart
  end

  def total
    '%.2f' % cart.total_price
  end

  def sales_tax
    '%.2f' % cart.total_tax
  end

  def print_receipt
    buffer = ''
    cart.items.each do |item|
      buffer.concat(item.decorate.show_data)
      buffer.concat("\n")
    end
    buffer.concat("\nSales Tax: " + sales_tax)
    buffer.concat("\nTotal: " + total + "\n")
    buffer
  end

  private
  attr_reader :cart
end