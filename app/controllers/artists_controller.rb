class ArtistsController < ApplicationController

  def index
    @artists = @board.artists.all
  end

  def show
  end

  def new
    @artist = @board.artists.new
  end

  def create
    @artist = @board.artists.new(artist_params)
    if @artist.save
      redirect_to board_artist_path(@board, @artist)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to board_artist_path(@board, @artist)
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to board_artist_path(@board)
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :genre, :rating)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end 
end
