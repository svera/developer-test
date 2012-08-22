class HotelsController < ApplicationController
  respond_to :html
    
  def index
    @hotels = Hotel.all
    respond_with @hotels
  end

  def show
    @hotel = Hotel.find(params[:id])
    respond_with @hotel
  end

  def new
    @hotel = Hotel.new
    respond_with @hotel
  end

  def create
    @hotel = Hotel.new(params[:hotel])  
    if @hotel
      flash[:notice] = "Successfully created hotel."
    end
    respond_with @hotel
  end  

  def edit
    @hotel = Hotel.find(params[:id])
    respond_with @hotel
  end
  
  def update
    @hotel = Calendar.find(params[:id])
    if @hotel.update_attributes(params[:hotel])
      flash[:notice] = "Successfully updated hotel."
    end
    respond_with @hotel
  end
    
  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    flash[:notice] = "Successfully destroyed hotel."
    respond_with @hotel
  end

end
