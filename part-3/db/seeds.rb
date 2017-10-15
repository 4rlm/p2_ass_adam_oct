puts "Seeding the database ..."


def seed_bid_table
  puts "Seeding the bid table..."
  total_seeds_required = 50
  current_seeds_in_db = Bid.count
  seeds_to_create = total_seeds_required - current_seeds_in_db

  # ["amount:decimal", "user_id:integer", "item_id:integer"]
  seeds_to_create.times do
    # bid_hash = {
    #   name: Faker::Lorem.word,
    #   description: Faker::Lorem.sentence,
    #   status: Faker::Lorem.word,
    #   rating: 5
    # }
    new_bid_record = Bid.new(bid_hash)
    new_bid_record.save!
  end

end
seed_bid_table


def seed_item_table
  puts "Seeding the item table..."
  total_seeds_required = 50
  current_seeds_in_db = Item.count
  seeds_to_create = total_seeds_required - current_seeds_in_db

  # ["name", "condition", "description", "start_time:datetime", "end_time:datetime", "status", "user_id:integer"]
  seeds_to_create.times do
    # item_hash = {
    #   name: Faker::Lorem.word,
    #   description: Faker::Lorem.sentence,
    #   status: Faker::Lorem.word,
    #   rating: 5
    # }
    new_item_record = Item.new(item_hash)
    new_item_record.save!
  end

end
seed_item_table


