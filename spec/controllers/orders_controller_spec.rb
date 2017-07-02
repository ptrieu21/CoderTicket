require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

	include Devise::Test::ControllerHelpers
	it 'gets index' do
		user = FactoryGirl.create :user
		sign_in user
		get 'index'
		expect(response).to be_success
	end
end
