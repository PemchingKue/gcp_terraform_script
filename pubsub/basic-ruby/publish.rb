require "google/cloud/pubsub"

pubsub = Google::Cloud::Pubsub.new(
  project_id: "pkplayground"
)

# Get a publisher for a topic
publisher = pubsub.publisher "my-topic"

# Publish a new message
msg = publisher.publish "new-message THIS IS A TEST"
puts msg