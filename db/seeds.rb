require 'faker'

puppies = 1.upto(1_000_000).map do
  {
    name: Faker::Name.name,
    age: rand(15),
    age_confirmed: [true, false].sample,
    microchipped: [true, false].sample
  }
end

Puppy.insert_all(puppies)
