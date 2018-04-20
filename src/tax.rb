class Tax
  def initialize price
    @price = price
  end

  def result
    price * tax_rate
  end

  def tax_rate
    raise NotImplementedError, "You must implement #{self.class}##{__method__}"
  end

  private

  attr_reader :price

  class << self
    def calculate price
      new(price).result
    end
  end
end