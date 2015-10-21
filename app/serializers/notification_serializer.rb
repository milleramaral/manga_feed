class NotificationSerializer < ActiveModel::Serializer
  attributes :name, :cover, :slug, :releases_count 

  has_many :releases

  def releases_count
    object.releases.count
  end
end