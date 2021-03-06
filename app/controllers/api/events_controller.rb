class API::EventsController < ApplicationController
  before_filter :set_access_control_headers
  skip_before_action :verify_authenticity_token

    def set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

    def create
      registeredapp = Registeredapp.find_by(url: request.env['HTTP_ORIGIN'])
      @event = Event.new(event_params)
      @event.registeredapp = registeredapp

    if @event.save
        render json: @event, status: :created
    else
        render json: @event.errors, status: :unprocessable_entity
    end
  end

    def preflight
        head 200
    end

  private
    def event_params
      params.require(:event).permit(:name)
    end
  end
