require 'rails_helper'

RSpec.describe Event, type: :model do

  describe ".upcoming" do
    it "return [] when there are no events" do
    	expect(Event.upcoming).to eq []
    end

    it "return [] when there are only past events" do
    	a = FactoryGirl.create :past_event
		  expect(Event.upcoming).to eq []
		end
    
    it "return [b] when there are a past event 'a' and a future event 'b'" do
		  a = FactoryGirl.create :past_event
		  b = FactoryGirl.create :future_event
		  expect(Event.upcoming).to eq [b]
		end
  end

  describe ".search" do
  	it "return search result when there are search string" do
  		a = FactoryGirl.create :test_event
  		expect(Event.search("test")).to include(a)
  	end
  end

  describe ".publish" do
  	it "return [] when event is not publishing" do
  		a = FactoryGirl.create :test_event
  		expect(Event.upcoming).to eq []
  	end

  	it "return [a] when event is publishing" do
  		a = FactoryGirl.create :test_event
  		a.publish
  		expect(Event.upcoming).to eq []
  	end
  end

  describe ".unpublish" do
  	it "return [] when event is unpublishing" do
  		a = FactoryGirl.create :test_event, :publish
  		a.unpublish
  		expect(Event.upcoming).to eq []
  	end
  end
end
