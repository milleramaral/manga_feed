class MangaPreviewSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :cover_url, :releases_count, :last_release
end
