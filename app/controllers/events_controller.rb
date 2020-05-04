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

  # def show
  #   profile = Profile.find_by(id: params[:id])
  #   render json: profile
  # end

  # def update
  #   # grab current_user id to build a profile onto
  #   # try is built in
  #   # {profile: {firstname, lastname, ....}}
  #   profile = Profile.find_by(id: params[:id])
  #   profile.update(
  #     firstname: params["profile"]["firstname"],
  #     lastname: params["profile"]["lastname"],
  #     bio: params["profile"]["bio"],
  #     birthday: params["profile"]["birthday"],
  #     # user_id: @current_user.id,
  #   )

  #   # conditional to render json object of a status notification, a boolean for logged in, and the user model data
  #   if profile
  #     session[:user_id] = @current_user.id
  #     render json: {
  #       status: :updated,
  #       logged_in: true,
  #       user: @current_user,
  #       profile: @current_profile,
  #     }
  #   else
  #     render json: { status: 401 }
  #   end
  # end
end
