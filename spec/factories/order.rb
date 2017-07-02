FactoryGirl.define do

	factory :order do 
		association :user, factory: :user
		association :ticket_type, factory: :ticket_type
		quantity 1
	end

	

end