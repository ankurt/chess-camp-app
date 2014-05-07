class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :check_login
  authorize_resource

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to @location, notice: "#{@location.name} location was added to the system."
    else
      render action: 'new'
    end
      # if @location.save
      #   format.html { redirect_to @location, notice: 'Location was successfully created.' }
      #   format.json { render action: 'show', status: :created, location: @location }
      # else
      #   format.html { render action: 'new' }
      #   format.json { render json: @location.errors, status: :unprocessable_entity }
      # end

  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  # def update
  #   respond_to do |format|
  #     if @location.update(location_params)
  #       format.html { redirect_to @location, notice: '#{@location.name} location was revised in the system' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @location.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  def update
    if @location.update(location_params)
      redirect_to @location, notice: "#{@location.name} location was revised in the system."
    else
      render action: 'edit'
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :street_1, :max_capacity, :street_2, :state, :city, :zip, :latitude, :longitude, :active)
    end
end
