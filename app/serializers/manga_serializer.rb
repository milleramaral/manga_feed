class MangaSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :cover_url, :description, :releases_count, :last_release
  has_many :releases
  
  def releases
    object.releases.order(id: :desc).limit(10)
  end
end
