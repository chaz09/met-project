class RegisteredappsController < ApplicationController

  def index

    @registeredapps = Registeredapp.all

  end

  def show
    @registeredapp = Registeredapp.find(params[:id])
    

  end

  def new
    @registeredapp = Registeredapp.new
  end

  def update

    @registeredapp = Registeredapp.find(params[:id])
    @registeredapp.name = paramas[:registeredapp][:name]
    @registeredapp.url = paramas[:registeredapp][:url]

    if @registeredapp.save
      flash[:notice] = "Registered application was saved!"
      redirect_to @registeredapp
    else
      flash.now[:alert] = "There was a problem saving the registered application"
      render :edit
    end
  end

  def create

    @registeredapp = Registeredapp.new
    @registeredapp.name = params[:registeredapp][:name]
    @registeredapp.url = params[:registeredapp][:title]

    if @registeredapp.save
      flash[:notice] = "Registered app was saved!"
      redirect_to @registeredapp
    else
      flash.now[:alert]= "There was an error saving this registered app"
      render :new
    end
  end

  def edit
    @registeredapp = registeredapp.find(params[:id])
  end

end
