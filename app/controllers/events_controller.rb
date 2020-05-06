class EventsController < ApplicationController
  include CurrentUserConcern

  def index
    events = Event.all

    if events
      render json: {
        status: :all_events_found,
        events: events,
      }
    else
      render json: { status: 500 }
    end
  end

  def show
    event = Event.find_by(id: params[:id])

    if event
      render json: {
        status: :event_found,
        event: event,
      }
    else
      render json: { status: 500 }
    end
  end

  def create
    cule = Cule.find_by(id: params[:id])

    event = Event.create!(
      title: params["event"]["title"],
      date: params["event"]["date"],
      time: params["event"]["time"],
      location: params["event"]["location"],
      details: params["event"]["details"],
      cule_id: params["event"]["cule_id"],
    )

    if event
      render json: {
        status: :created,
        event: event,
      }
    else
      render json: { status: 500 }
    end
  end

  def update
    event = Event.find_by(id: params[:id])
    event.update(
      title: params["event"]["title"],
      date: params["event"]["date"],
      time: params["event"]["time"],
      location: params["event"]["location"],
      details: params["event"]["details"],
    )

    if profile
      render json: {
        status: :updated,
        event: event,
      }
    end
  end

  def destroy
    event = Event.find_by(id: params[:id])
    event.destroy
  end
end
