class AddBleach < ActiveRecord::Migration
  def change
    bleach = Manga.create(name: "Bleach", cover_url: "http://senpuu.com.br/wp-content/uploads/2013/08/bleach-4-todos-os-personagens.jpg", description: "Bleach (ブリーチ, Burīchi?) é uma série de mangá japonesa escrita e ilustrada por Tite Kubo. Bleach segue as aventuras de Ichigo Kurosaki, que após ganhar poderes de um Shinigami (死神? literalmente, 'Deus da morte'), personificação da morte, similar á Morte — através de outro Shinigami, Rukia Kuchiki. Seus novos poderes o forçam a assumir o dever de defender os humanos de espíritos malignos e guiar almas ao mundo pós-vida, Soul Society.")
    get_releases(bleach.id)
  end

  def get_releases(manga_id)
    site = "http://kononline.info/capitulos"
    doc = Nokogiri::HTML(open(site))
    releases = doc.css('.ui.ten.column.grid a')

    releases.each do |release|
      Manga.find(manga_id).releases.create(chapter: release.text, link: "#{site}/#{release.text}")
    end

    releases
  end
end
