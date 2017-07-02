FactoryGirl.define do

	factory :ticket_type do 
		name "Ticket A"
		price 1000
		max_quantity 10
		association :event, factory: :test_event
	end

end