FactoryGirl.define do

	factory :past_event, class: Event do 
		name "past"
		category {Category.new}
		venue {Venue.new}
		extended_html_description "a past event"
		starts_at { 2.days.ago}
		ends_at {1.days.ago}
		publish_at {1.days.ago}
	end

	factory :future_event, class: Event do 
		name "future"
		category {Category.new}
		venue {Venue.new}
		extended_html_description "a future event"
		starts_at { 1.days.from_now}
		ends_at {3.days.from_now}
		publish_at {1.days.ago}
	end

	factory :test_event, class: Event do 
		name "test"
		category {Category.new}
		venue {Venue.new}
		extended_html_description "a test event"
		starts_at { 1.days.ago}
		ends_at {3.days.from_now}

		trait :publish do
			publish_at {1.days.ago}
		end
	end

end