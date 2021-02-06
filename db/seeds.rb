10.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n + 1}@example.com"
  User.create!(email: email, password: email, first_name: first_name, last_name: last_name)
end

def rand_id(from, to)
  Faker::Number.between(from: from, to: to)
end

3.times do
  Friendship.create!([{ user_id: rand_id(1, 10), friend_id: rand_id(1, 10) }])
end
