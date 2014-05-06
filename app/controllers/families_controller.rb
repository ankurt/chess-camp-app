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
    @family = Family.new(family_params)
    if @family.save
      redirect_to @family, notice: "#{@family.family_name} family was added to the system."
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
    if @family.update(family_params)
      redirect_to @family, notice: "#{@family.family_name} family was revised in the system"
    else
      render action: 'edit'
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
