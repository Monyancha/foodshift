# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

def create_donations
  1.upto(5) do |n|
    Donation.create!(
    organization: "Blueprint",
    address: "Sutardja Dai Hall, Berkeley, CA 94709",
    person: ["Alli", "Atsu", "Harrison", "Erica", "Quinton"].sample,
    phone: "408-283-6923",
    email: "foodshift@shiftfood.org",
    refrigeration: [true, false].sample,
    quantity: "10",
    window_start: DateTime.new(2014, 8, 21, 8, 0),
    window_end: DateTime.new(2014, 8, 21, 11, 0),
    food_type: ["Bread", "Bulk", "Dairy", "Juice", "Mixed", "Meat", "Prepared", "Produce"].sample,
    longitude: "37.8747924",
    latitude: "-122.2583104")
  end
end

def create_users
  1.upto(5) do |n|
    Donor.create!(
    email: "donor#{n}@foodshift.net",
    password: "password",
    type: "Donor")
  end

  1.upto(5) do |n|
    Recipient.create!(
    email: "recipient#{n}@foodshift.net",
    password: "password",
    type: "Recipient")
  end

  1.upto(5) do |n|
    Coordinator.create!(
    email: "coordinator#{n}@foodshift.net",
    password: "password",
    type: "Coordinator")
  end
end

create_donations
create_users
