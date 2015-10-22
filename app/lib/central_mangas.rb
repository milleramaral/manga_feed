require 'open-uri'

class CentralMangas
  include ActiveModel::Serialization

  SITE = 'http://centraldemangas.org'

  def self.update
    doc = Nokogiri::HTML(open(SITE))

    doc.css('div.lancto').each do |lancamento|

      title = lancamento.css('p strong a').attr('title').to_s

      url = lancamento.css('p strong a').attr('href').to_s
      url = SITE + url if url.starts_with? '/'

      chapter = url.split('/').last

      cover_url = lancamento.css('img.img-thumbnail').attr('src').to_s.gsub('60x80', '150x200')

      manga = update_or_create_manga(title, cover_url)
      add_release(manga, url, chapter)
    end
  end

  private

  def self.update_or_create_manga(title, cover_url)
    if manga = Manga.find_by_name(title)
      manga.update cover_url: cover_url
    else
      manga = Manga.create(name: title, cover_url: cover_url, description: 'Sem descrição')
    end

    manga
  end

  def self.add_release(manga, url, chapter)
      manga.releases.create(
          link: url,
          chapter: chapter
      ) unless manga.releases.where(chapter: chapter).any?
  end

end
