require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /events" do
    it "accepts search on the homepage" do
      a = FactoryGirl.create :test_event, :publish, name: "Scorpion in Vietnam"
      b = FactoryGirl.create :test_event, :publish, name: "Dam Vinh Hung"

      get root_path(search: "Scorpion")
      expect(response).to have_http_status(200)
      expect(response.body).to include "Scorpion in Vietnam"
      expect(response.body).to_not include "Dam Vinh Hung"
    end
  end
end
