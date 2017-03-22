15.times do
  user_info = {
    email: Faker::Internet.email,
    username: Faker::Name.name.split.join.downcase,
    password: "password"
  }
  User.create!(user_info)
end

3.times do
  potluck_info = {
    name: "The " + Faker::Hipster.words(3).map(&:capitalize).join(" ") + " Potluck",
    location: Faker::Friends.location,
    start_time: Faker::Time.forward(14, :evening),
    organizer_id: rand(1..15)
  }
  Potluck.create!(potluck_info)
end

event_1 = [
  {potluck_id: 1, guest_id: 1, dish: Faker::Food.spice + " " + Faker::Food.ingredient},
  {potluck_id: 1, guest_id: 2, dish: Faker::Food.spice + " " + Faker::Food.ingredient},
  {potluck_id: 1, guest_id: 3, dish: Faker::Food.spice + " " + Faker::Food.ingredient},
  {potluck_id: 1, guest_id: 4, dish: Faker::Food.spice + " " + Faker::Food.ingredient},
  {potluck_id: 1, guest_id: 5, dish: Faker::Food.spice + " " + Faker::Food.ingredient},
]
Attending.create!(event_1)

event_2 = [
  {potluck_id: 2, guest_id: 6, dish: Faker::Food.spice + " " + Faker::Food.ingredient},
  {potluck_id: 2, guest_id: 7, dish: Faker::Food.spice + " " + Faker::Food.ingredient},
  {potluck_id: 2, guest_id: 8, dish: Faker::Food.spice + " " + Faker::Food.ingredient},
  {potluck_id: 2, guest_id: 9, dish: Faker::Food.spice + " " + Faker::Food.ingredient},
  {potluck_id: 2, guest_id: 10, dish: Faker::Food.spice + " " + Faker::Food.ingredient},
]
Attending.create!(event_2)

event_3 = [
  {potluck_id: 3, guest_id: 11, dish: Faker::Food.spice + " " + Faker::Food.ingredient},
  {potluck_id: 3, guest_id: 12, dish: Faker::Food.spice + " " + Faker::Food.ingredient},
  {potluck_id: 3, guest_id: 13, dish: Faker::Food.spice + " " + Faker::Food.ingredient},
  {potluck_id: 3, guest_id: 14, dish: Faker::Food.spice + " " + Faker::Food.ingredient},
  {potluck_id: 3, guest_id: 15, dish: Faker::Food.spice + " " + Faker::Food.ingredient},
]
Attending.create!(event_3)


