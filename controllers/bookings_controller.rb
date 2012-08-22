class BookingsController < ApplicationController
  respond_to :html
    
  def index
    @bookings = Booking.all
    respond_with @bookings
  end

  def new
    @booking = Booking.new
    respond_with @booking
  end

  def create
    @booking = Booking.new(params[:booking])
    if @booking
      flash[:notice] = "Booking successfully made."
    end
    respond_with @booking
  end  
  
  # The following actions would need some kind of authorization system
  # so only the owner could access them
  def show
    @booking = Booking.find(params[:id])
    respond_with @booking
  end

  def edit
    @booking = Booking.find(params[:id])
    respond_with @hotel
  end
  
  def update
    @booking = Booking.find(params[:id])
    if @hotel.update_attributes(params[:booking])
      flash[:notice] = "Successfully updated booking."
    end
    respond_with @booking
  end
    
  def destroy
    @booking = Booking.find(params[:id])
    # We better mark the bookings to be cancelled as such instead of delete them
    @booking.status = -1
    @booking.save
    flash[:notice] = "Booking successfully cancelled."
    respond_with @booking
  end

end
