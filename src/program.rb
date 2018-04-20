require File.expand_path(File.join(__FILE__, '..', 'cart'))
require File.expand_path(File.join(__FILE__, '..', 'item'))
require "csv"

class Program
  class << self
    def run input_folder
      Dir.foreach(input_folder) do |file|
        next unless /^.+\.csv$/ =~ file
        cart = Cart.new
        CSV.foreach("#{input_folder}/#{file}", headers: true) do |row|
          cart.add_to_cart(Item.new(row.to_h))
        end
        print "------------Output for #{file.split('.').first}--------------------\n"
        print cart.decorate.print_receipt
        print "\n------------End output--------------------\n\n\n"
      end
    end
  end
end


Program.run "input"




