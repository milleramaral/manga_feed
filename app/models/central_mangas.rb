require 'open-uri'

class CentralMangas
  SITE = 'http://centraldemangas.org'
  MANGAS = [
    'Bleach',
    'Fairy Tail',
    'One Piece',
    'Naruto'
  ]

  attr_reader :doc

  def initialize
    @doc = Nokogiri::HTML(open(SITE))
  end

  def lancamentos
    lancamentos = []
    doc.css('div.lancto').each do |lancamento|
      title = lancamento.css('p strong a').attr('title').to_s
      url = lancamento.css('p strong a').attr('href').to_s
      url = SITE + url if url.starts_with? '/'
      image = lancamento.css('img.img-thumbnail').attr('src').to_s
      moment = lancamento.css('span.moment').first.content.to_datetime

      if MANGAS.include?(title)
        lancamentos << OpenStruct.new(title: title, url: url, image: image, moment: moment)
      end
    end

    lancamentos
  end

end
