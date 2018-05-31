class SongsController < ApplicationController
  before_action :set_artist

  def index
    @songs = @artist.songs
  end

  def show
  end

  def new
    @song = @artist.songs.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @song = @artist.songs.new(songs_params)

    if @song.save
      redirect_to [@artist, @song]
    else
      render :new
    end
  end

  def update
    if @song.update(song_params)
      redirect_to [@artist, @song]
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to artist_songs_path
  end

  private
  
    def set_artist
      @artist = Artist.find(params[:artist])
    end

    def songs_params
      params.require(:song).permit(:name, :rating)
    end
end
