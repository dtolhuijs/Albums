class SongsController < ApplicationController
  def index
    @songs = Song.order(year: :asc)
  end

  def edit
    @song = Song.find( params[:id])
  end

  def update
     @song = Song.find( params[:id] )

     if @song.update_attributes( song_params )
       redirect_to @song
     else
       render 'edit'
     end
   end

  def new
    @song = Song.new
    @song.artist_id = params[:artist_id]
  end

  def show
    @song = Song.find( params[:id])
  end

  def create
      song = Song.new( song_params )

      if song.save
         redirect_to artist_path( song.artist_id )
      else
         render new_song_path
      end
   end

  def destroy
       @song = Song.find( params[:id] )

       artist_id = @song.artist_id

       @song.destroy

       redirect_to artist_path( artist_id )
     end

     private

   def song_params
     params.require( :song ).permit( :title, :year, :cover, :lyrics, :artist_id, )
   end
end
