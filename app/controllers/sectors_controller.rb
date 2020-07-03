class SectorsController < ApplicationController
  def index
    @sectors = Sector.all
  end

  def new
    @sector = Sector.new
  end

  def create
    @sector = Sector.create(params.require(:sector).permit(:name))
  end

  def show
    @sector = Sector.find(params[:id])
  end

  def edit
    @sector = Sector.find(params[:id])
  end

  def destroy
    @sector = Sector.find(params[:id])
    @sector.destroy
  end
end
