# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


ApiKey.create!(key: "e0cf239d-65d4-45a6-b2f7-18400a620f74")
ApiKey.create!(key: "32af3f39-5ec5-47b5-8d44-a96fb8ff01c0")