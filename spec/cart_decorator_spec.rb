require File.expand_path(File.join(__FILE__, '..', '../src/cart_decorator'))
require File.expand_path(File.join(__FILE__, '..', '../src/cart'))
require File.expand_path(File.join(__FILE__, '..', '../src/item'))
RSpec.describe CartDecorator do
  describe "#print_receipt" do
    subject {described_class.new(cart).print_receipt}

    context "when product is not imported and kind is book" do
      let(:cart){Cart.new}

      before do
        item = Item.new("product" => "book", "price" => 100.00, "quantity" => 2)
        cart.add_to_cart(item)
      end

      it{is_expected.to eq "2, book, 100.00\n\nSales Tax: 0.00\nTotal: 100.00\n"}
    end

    context "when product is imported and kind is book" do
      let(:cart){Cart.new}

      before do
        item = Item.new("product" => "imported book", "price" => 100.00, "quantity" => 1)
        cart.add_to_cart(item)
      end

      it{is_expected.to eq "1, imported book, 105.00\n\nSales Tax: 5.00\nTotal: 105.00\n"}
    end

    context "when product is imported and kind is not in book, chocolate, pill" do
      let(:cart){Cart.new}

      before do
        item = Item.new("product" => "imported bottle of perfume", "price" =>  100.00, "quantity" => 1)
        cart.add_to_cart(item)
      end

      it{is_expected.to eq "1, imported bottle of perfume, 115.00\n\nSales Tax: 15.00\nTotal: 115.00\n"}
    end

    context "when product is not import and kind is not in book, chocolate, pill" do
      let(:cart){Cart.new}

      before do
        item = Item.new("product" => "bottle of perfume", "price" =>  100.00, "quantity" => 1)
        cart.add_to_cart(item)
      end

      it{is_expected.to eq "1, bottle of perfume, 110.00\n\nSales Tax: 10.00\nTotal: 110.00\n"}
    end
  end

end