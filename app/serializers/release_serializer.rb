class ReleaseSerializer < ActiveModel::Serializer
  attributes :id, :link, :chapter, :created_at

  def created_at
    object.created_at.to_s
  end

end
