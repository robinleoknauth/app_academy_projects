class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save

      redirect_to bands_url
    else
      flash.now[:errors] = ["Noooo! Something went kaputt!"]
      render :new
    end

  end

  def band_params
    params.require(:band).permit(:name)
  end
end
