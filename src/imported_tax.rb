require File.expand_path(File.join(__FILE__, '..', 'tax'))

class ImportedTax < Tax
  def tax_rate
    0.05
  end
end