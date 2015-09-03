class FlightsController < ApplicationController

  def index
    @dates = Flight.order("start_time asc").all.map { |flight| [flight.start_time.strftime("%b %d %Y")] }.uniq
    @passengers = [1, 2, 3, 4]
    @airports = Airport.all

    if !params[:from_airport].nil?
      @from = params[:from_airport]
      @to = params[:to_airport]
      @date = params[:date]
      @passengers_select = params[:passengers]
      @flightsearch = Flight.search(@from, @to, @date)
    end
  end


  def paymentstatus
    render 'paymentstatus.html.erb'
  end



  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def flight_params
      params.permit(:from_airport, :to_airport, :date, :passengers)
    end
end
