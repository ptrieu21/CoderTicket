class EventsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  def index
    if params[:search].present?
    	@events = Event.search(params[:search]).upcoming
    else
    	@events = Event.upcoming
    end

  end

  def my_event
  	@events = current_user.events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
  	@event = Event.new
  end

  def create
  	@event = current_user.events.build(event_params)
  	if @event.save
  		flash[:success] = "Event has succssfully created!" 
  	else
  		render 'new'
  	end
  end


  private
  	def event_params
  		params.require(:event).permit(
  																	:starts_at, 
  																	:ends_at, 
  																	:venue_id, 
  																	:hero_image_url, 
  																	:extended_html_description, 
  																	:category_id, 
  																	:name
  																	)
  	end
end
