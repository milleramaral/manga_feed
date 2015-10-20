class AddFairyTail < ActiveRecord::Migration
  def change
    manga = Manga.create(name: "Fairy Tail", cover_url: "http://animalog.com.br/wp-content/uploads/2015/10/fairy-tail-255-anime-online-2014.jpg", description: "A história de Fairy Tail gira em torno das aventuras da guilda(cujo o nome é o mesmo do título do anime) , narrada pelo ponto de vista da protagonista Lucy Heartfilia. Lucy é uma jovem maga de 17 anos que deseja tornar-se uma maga evoluída. Para isso, ela terá que entrar em uma guilda de magos, para ganhar dinheiro para sobreviver e também para aprimorar suas habilidades.")
    get_releases(manga.id)
  end

  def get_releases(manga_id)
    site = "http://fairytailmanga.com.br/leitura/online/capitulo/457"
    doc = Nokogiri::HTML(open(site))
    releases = doc.css('#manga_caps option')
   
    releases_hash = []
    releases.each do |release| 
      
      chapter = release.text
      link = "http://fairytailmanga.com.br/leitura/online/capitulo/#{chapter}"

      releases_hash << {chapter: chapter, link: link}
    end

    Manga.find(manga_id).releases.create(releases_hash)

    releases
  end
end
