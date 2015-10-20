require 'open-uri'

class CentralMangas < Struct.new(:title, :url, :image, :moment)
  include ActiveModel::Serialization

  SITE = 'http://centraldemangas.org'
  MANGAS = [
    'Bleach',
    'Fairy Tail',
    'One Piece',
    'Naruto'
  ]

  def self.lancamentos
    @doc = Nokogiri::HTML(open(SITE))
    lancamentos = []
    @doc.css('div.lancto').each do |lancamento|
      title = lancamento.css('p strong a').attr('title').to_s
      url = lancamento.css('p strong a').attr('href').to_s
      url = SITE + url if url.starts_with? '/'
      image = lancamento.css('img.img-thumbnail').attr('src').to_s
      moment = lancamento.css('span.moment').first.content.to_datetime

      lancamentos << new(title, url, image, moment) #if MANGAS.include?(title)
    end

    lancamentos
  end

end
