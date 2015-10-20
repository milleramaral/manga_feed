class AddOnePiece < ActiveRecord::Migration
  def change
    manga = Manga.create(
      name: "One Piece", 
      cover_url: "http://thenerdside.com.br/wp-content/uploads/2015/04/One-Piece-3.jpg", 
      description: "One Piece (ワンピース, Wan Pīsu?) é uma obra de anime e mangá criada pelo mangaká Eiichiro Oda. A história está focada na tripulação pirata comandada pelo Capitão Monkey D. Luffy. A maior ambição de Luffy é obter o maior tesouro do mundo, o One Piece e assim ocupar o posto deixado pelo finado Rei dos Piratas Gol D. Roger."
      )
    get_releases(manga.id)
  end

  def get_releases(manga_id)
    site = "http://onepiececentral.com.br/capitulos/803"
    doc = Nokogiri::HTML(open(site))
    releases = doc.css('#mangaCaps option')
   
    releases_hash = []
    releases.each do |release| 
      
      chapter = release.text
      link = "http://onepiececentral.com.br/capitulos/#{chapter}"

      releases_hash << {chapter: chapter, link: link}
    end

    Manga.find(manga_id).releases.create(releases_hash)

    releases
  end
end
