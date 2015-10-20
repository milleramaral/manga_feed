class MangasController < ApplicationController

  def index
    @mangas = Manga.all
  end

  def show
    @manga = Manga.friendly.find(params[:id])
    @releases = @manga.releases.order(id: :desc).limit(10)
  end
  
end