class EventsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_event, except: [:index, :new, :create, :my_event]
	before_action :require_same_user, except: [:index, :show, :my_event, :new, :create]
	 


  def index
    if params[:search].present?
    	@events = Event.search(params[:search]).upcoming
    else
    	@events = Event.upcoming
    end

  end

  def my_event
  	@events = current_user.events.sort_by{ |a| a.created_at } 
  end

  def publish
  	if !@event.publish
  		flash[:error] = "Event must have at least one ticket types"
  	end
  	redirect_to my_event_path
  end

  def unpublish
  	@event.unpublish
  	redirect_to my_event_path
  end

  def show
  end

  def new
  	@event = Event.new
  end

  def create
  	@event = current_user.events.build(event_params)
  	if @event.save
  		flash[:success] = "Event has succssfully created!" 
  		redirect_to new_event_ticket_path(@event)
  	else
  		render 'new'
  	end
  end

  def edit

  end

  def update
  	if @event.update(event_params)
  		flash[:success] = "Event has succssfully edited!"
  		redirect_to new_event_ticket_path(@event)
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@event.destroy
  	redirect_to new_event_path
  end


  private
  	def set_event
  		@event = Event.find(params[:id])
  	end

  	def require_same_user
  		if current_user != @event.user 
  			flash[:error] = "Not authenticated!"
  			redirect_to root_path

  		end
  	end

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
