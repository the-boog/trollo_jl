5.times do |board|
  Board.create(
    name: Faker::Name.first_name,
    user_id: 1
    )
end


5.times do |list|
  List.create(
    name: Faker::Name.first_name,
    priority: rand(1..5),
    board_id: rand(12..30)
    )
end

5.times do |task|
  Task.create(
  name: Faker::Name.first_name,
  priority: rand(1..5),
  description: Faker::Games::Pokemon.move
  )
end

