desc 'run notification'

require 'pubnub'

task notify: :environment do
  Notification.notify!
end
