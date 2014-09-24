class EventsController < ApplicationController
  before_filter :ensure_logged_in, only: [:create, :new]

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(params[:event])
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def index
    @upcoming = Event.upcoming
    @previous = Event.previous
  end

private
  def ensure_logged_in
    if !logged_in?
      redirect_to login_path
    end
  end
end
