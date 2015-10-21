class API::MangasController < APIController

  def index
    @mangas = Manga.all
    render json: @mangas, root: false, each_serializer: MangaPreviewSerializer
  end

  def show
    @manga = Manga.friendly.find(params[:id])
    render json: @manga, root: false
  end
  
end