class Release < ActiveRecord::Base
  belongs_to :manga, counter_cache: true
  after_create :notify_users

  def notify_users
    Notification.send_message("Lançamento", "#{manga} #{chapter}")
  end
end
