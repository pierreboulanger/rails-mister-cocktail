class CocktailController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      flash[:notice] = "New cocktail successfully created !!"
      redirect_to cocktail_path(@cocktail.id)
    else
      flash[:notice] = "Oops something went wrong !!"
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, photos: [])
  end
end
