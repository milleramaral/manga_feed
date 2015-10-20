class Release < ActiveRecord::Base
  belongs_to :manga, counter_cache: true
end
