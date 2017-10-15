require 'faker'

Post.destroy_all

3.times do
  Post.create({
    :body => Faker::Lorem.paragraph(8, false, 2),
    :hometown => Faker::Address.city,
    :guest_name => Faker::Name.first_name,
    :likes_count => rand(5),
    :created_at => Faker::Date.between(6.months.ago, 1.day.ago),
  })
end
