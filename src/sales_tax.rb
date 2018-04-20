require File.expand_path(File.join(__FILE__, '..', 'tax'))

class SalesTax < Tax
  def tax_rate
    0.1
  end
end