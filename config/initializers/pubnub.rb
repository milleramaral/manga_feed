require 'dotenv'
Dotenv.load unless Rails.env.production?

my_logger = Logger.new(STDOUT)

PUBNUB = Pubnub.new(
  :subscribe_key    => ENV['SUBSCRIBE_KEY'],
  :publish_key      => ENV['PUBLISH_KEY'],
  :secret_key      => ENV['SECRECT_KEY'],
  :error_callback   => lambda { |msg| puts "Error callback says: #{msg.inspect}" },
  :connect_callback => lambda { |msg| puts "CONNECTED: #{msg.inspect}" },
  :logger => my_logger
  )
