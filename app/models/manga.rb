class Manga < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :releases, dependent: :destroy

  def to_s
    name
  end

end
