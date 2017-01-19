class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_signed_in

  def index
    @bands = Band.all
  end

  def show
  end

  def new
    @band = Band.new
  end

  def edit
  end

  def create
    @band = Band.new(band_params)
    if @band.save
       redirect_to @band, notice: 'Band was successfully created.'
    else
       render :new
    end

  end

  def update
    if @band.update(band_params)
       redirect_to @band, notice: 'Band was successfully updated.'
    else
       render :edit
    end

  end

  def destroy
    @band.destroy
    redirect_to bands_url, notice: 'Band was successfully destroyed.'

  end

  private
    def set_band
      @band = Band.find(params[:id])
    end

    def band_params
      params.require(:band).permit(:name)
    end
end
