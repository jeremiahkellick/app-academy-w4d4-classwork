class AlbumsController < ApplicationController
  before_action :must_be_logged_in

  def new
    @album = Album.new(band: Band.find(params[:band_id]))
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to band_url(@album.band)
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :studio, :band_id)
  end
end
