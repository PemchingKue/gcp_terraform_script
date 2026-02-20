require "google/cloud/pubsub"

pubsub = Google::Cloud::Pubsub.new(
  project_id: "pkplayground"
)

subscriber = pubsub.subscriber "my-topic-sub"

unless subscriber
  puts "Subscription not found!"
  exit
end

listener = subscriber.listen do |received_message|
  puts "Data: #{received_message.message.data}"
  received_message.acknowledge!
end

listener.on_error do |exception|
  puts "Exception: #{exception.class} #{exception.message}"
end

listener.start

puts "Listening..."
sleep
