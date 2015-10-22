require 'pubnub'

namespace :manga do
  desc "updated manga's feeds"
  task update: :environment do
    CentralMangas.update
  end
end

desc 'run notification'
task notify: :environment do
  Notification.notify!
end
