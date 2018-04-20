require File.expand_path(File.join(__FILE__, '..', 'item'))

class ItemDecorator
  def initialize item
    @item = item
  end

  def price_included_tax
    '%.2f' % item.price_included_tax
  end

  def show_data
    "#{item.quantity}, #{item.product}, #{price_included_tax}"
  end

  private

  attr_reader :item

end