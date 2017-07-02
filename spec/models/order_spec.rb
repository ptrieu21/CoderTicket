require 'rails_helper'

RSpec.describe Order, type: :model do
	describe "#quantity" do
		it "should validate avaiable quantity" do
			ticket = FactoryGirl.create :ticket_type, max_quantity: 2
			order = FactoryGirl.build :order, quantity: 3, ticket_type: ticket
			order.valid?
			order.errors[:quantity].should include("must less than ticket's max quantity")
		end
	end

	
  describe ".total_price" do
  	it "return correct total price" do
  		ticket = FactoryGirl.create :ticket_type, price: 10000
  		order = FactoryGirl.create :order, quantity: 2, ticket_type: ticket

  		expect(order.total_price).to eq 20000
  	end
	end
end
