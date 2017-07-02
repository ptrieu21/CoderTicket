class TicketsController < ApplicationController
	before_action :set_event

  def new
    @ticket = TicketType.new
    @tickets = @event.ticket_types
  end

  def create
  	@ticket = @event.ticket_types.build(ticket_params)
    if @ticket.save
      flash[:success] = "Ticket was successfullty created!"
      redirect_to new_event_ticket_path(@event)
    else
      flash[:error] = "Oops, something wrong with your ticket, make sure price and quantity is numberic"
      redirect_to new_event_ticket_path(@event)
    end
  end

  def destroy
    @ticket = TicketType.find(params[:id])
    @ticket.destroy
    redirect_to new_event_ticket_path(@event)
  end

  private 
  	def set_event
  		@event = Event.find(params[:event_id])
  	end
  	def ticket_params
  		params.require(:ticket_type).permit(:name, :price, :max_quantity)
  	end
end
