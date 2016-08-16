class DoseController < ApplicationController
  before_action :find_cocktail, only: [:new, :create, :destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    #does the same thing as :
    # @dose = Dose.new
    # @dose.cocktail = @cocktail
    # @dose.save

    if @dose.save
      flash[:notice] = "New cocktail successfully created !!"
      redirect_to cocktail_path(@cocktail.id)
    else
      flash[:notice] = "Oops something went wrong !!"
      render "new"
    end
  end

  def destroy
    @dose = @cocktail.doses.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail.id)
  end

private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
