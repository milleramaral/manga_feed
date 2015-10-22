class Notification < Struct.new(:name, :cover, :slug, :releases)
  include ActiveModel::Serialization

  def self.all
    to = DateTime.now
    from = to - 500.minutes
    releases = Release.where(created_at: from..to).group_by(&:manga)

    releases.map do |release|
      manga = release.first
      _releases = release.last
      new(manga.name, manga.cover_url, manga.slug, _releases)
    end
  end

  def self.notify!
    items = []

    notification = Notification.all

    notification.each do |manga|
      manga.releases.each { |release| items << { title: manga.name, message: "Capítulo #{release.chapter}" } }
    end

    options = { type: "list", title: "Novos capítulos disponíveis.", message: "Novos capítulos disponíveis", iconUrl: "images/icon-128.png", items: items }

    PUBNUB.publish(:channel  => "mangas", :message  => options.to_json, http_sync: true)
  end

  def self.send_message(title, message, cover_url = "images/icon-128.png")
    options = { type: "basic", title: title, message: message, iconUrl: cover_url }

    PUBNUB.publish(:channel  => "mangas", :message  => options.to_json, http_sync: true)
  end

end
