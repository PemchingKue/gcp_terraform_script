require "google/cloud/firestore"

firestore = Google::Cloud::Firestore.new(
  project_id: "pkplayground",
  database_id: "todos"
)

collection = firestore.col("tasks")

collection.get do |doc|
  puts "Document ID: #{doc.document_id}"
  puts doc.data
  puts "----------------------"
end