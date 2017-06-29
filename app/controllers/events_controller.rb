class EventsController < ApplicationController
  def index
    if params[:search].present?
    	@events = Event.search(params[:search]).upcoming
    else
    	@events = Event.upcoming
    end

  end

  def show
    @event = Event.find(params[:id])
  end
end
