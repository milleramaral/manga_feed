class MangasController < ApplicationController

  def index
    @mangas = Manga.all
  end

  def show
    @manga = Manga.friendly.find(params[:id])
  end
  
end