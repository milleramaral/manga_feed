class Notification < Struct.new(:name, :cover, :slug, :releases)
  include ActiveModel::Serialization
  
  def self.all
    to = DateTime.now
    from = to - 90.minutes
    releases = Release.where(created_at: from..to).group_by(&:manga)

    releases.map do |release| 
      manga = release.first
      _releases = release.last
      new(manga.name, manga.cover_url, manga.slug, _releases)
    end

  end

end