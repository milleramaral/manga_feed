class NotificationsCollectionSerializer < ActiveModel::Serializer
  attributes :releases_count, :notifications
  has_many :notifications
  
  def releases_count
    object.sum(0) { |manga| manga.releases.count }
  end
  
  def notifications
    object
  end
end