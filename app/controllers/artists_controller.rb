class ArtistsController < ApplicationController
  def index
    @artists = Artist.order(name: :asc)
  end

  def edit
     @artist = Artist.find( params[:id] )
  end

  def update
     @artist = Artist.find( params[:id] )

     if @artist.update_attributes( artist_params )
        redirect_to @artist
     else
        render 'edit'
     end
  end

  def new
    @artist = Artist.new
  end

  def show
    @artist = Artist.find( params[:id])
  end

  def create
     artist = Artist.new( artist_params )

     if artist.save
        redirect_to artists_path
     else
        render 'new'
     end
  end

  def destroy
     @artist = Artist.find( params[:id] )

     @artist.destroy

     redirect_to artist_path
  end

private

  def artist_params
     params.require( :artist ).permit( :name, :country, :bio )
  end
end
