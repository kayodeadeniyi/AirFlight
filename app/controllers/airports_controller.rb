class AirportsController < ApplicationController
  before_action :set_airport, only: [:show, :edit, :update, :destroy]

  # GET /airports
  # GET /airports.json
  def index
    @airports = Airport.all
  end

  # GET /airports/1
  # GET /airports/1.json
  def show
  end

  # GET /airports/new
  def new
    @airport = Airport.new
  end

  # GET /airports/1/edit
  def edit
  end

  # POST /airports
  # POST /airports.json
  def create
    @airport = Airport.new(airport_params)

    respond_to do |format|
      if @airport.save
        format.html { redirect_to @airport, notice: 'Airport was successfully created.' }
        format.json { render :show, status: :created, location: @airport }
      else
        format.html { render :new }
        format.json { render json: @airport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /airports/1
  # PATCH/PUT /airports/1.json
  def update
    respond_to do |format|
      if @airport.update(airport_params)
        format.html { redirect_to @airport, notice: 'Airport was successfully updated.' }
        format.json { render :show, status: :ok, location: @airport }
      else
        format.html { render :edit }
        format.json { render json: @airport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airports/1
  # DELETE /airports/1.json
  def destroy
    @airport.destroy
    respond_to do |format|
      format.html { redirect_to airports_url, notice: 'Airport was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airport
      @airport = Airport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def airport_params
      params[:airport]
    end
end
