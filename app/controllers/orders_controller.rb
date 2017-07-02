class OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_ticket, only: [:new, :create]

	def new
		@orders = []
		@tickets.each do |ticket|
			@orders << current_user.orders.build(ticket_type_id: ticket.id)
		end
	end

	def create
		params["orders"].each do |order|
			if order["quantity"].to_i > 0
				Order.create(order_params(order))
			end
		end

		UserMailer.order_email(current_user).deliver
		flash[:success] = "Orders were successfully created!"
		redirect_to orders_path
	end

	def index
		@orders = current_user.orders

	end

	private 
		def set_ticket
			@event = Event.find(params[:event_id])
			@tickets = @event.ticket_types
		end

		def order_params(od_params)
			od_params.permit(:quantity, :ticket_type_id).merge(user_id: current_user.id)
		end
end
