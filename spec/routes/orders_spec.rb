require 'rails_helper'

RSpec.describe "orders", type: :routing do
  it "routes to list of all routes" do
    expect(get: "orders").to route_to(controller: "orders", action: "index")
  end
end