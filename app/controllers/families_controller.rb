class FamiliesController < ApplicationController
      # before_action :check_login
  before_action :set_family, only: [:show, :edit, :update, :destroy]

  def index
    @families = Family.active.alphabetical.paginate(:page => params[:page]).per_page(10)
  end

  def new
    @family = Family.new
  end

  def show
    @family = set_family
  end

  def create
    @family = Location.new(family_params)
    if @location.save
      redirect_to @family, notice: "#{family.name} family was added to the system."
    else
      render action: 'new'
    end
  end

  def destroy
    @family.destroy
    respond_to do |format|
      format.html { redirect_to families_url }
      format.json { head :no_content }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @family.update(family_params)
        format.html { redirect_to @family, notice: '#{@family.name} family was revised in the system' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_family
    @family = Family.find(params[:id])
  end

  def family_params
    params.require(:family).permit(:family_name, :parent_first_name, :email, :phone, :active)
  end
end
