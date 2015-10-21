class Manga < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :releases, dependent: :destroy

  def to_s
    name
  end

  def last_release
    releases.last.created_at.to_s
  end

end
