# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Create users"

benoit = User.create(
  email: "bg1@mail.com",
  first_name: "Benoît",
  last_name: "Habfast")

gauthier = User.create(
  email: "bg2@mail.com",
  first_name: "Gauthier",
  last_name: "Lagae")

const = User.create(
  email: "bg3@mail.com",
  first_name: "Constantin",
  last_name: "Ehrlich-Adam")

puts "Create Events"

bday_benoit = Event.create(
  start_date: DateTime.new(2017,11, 10),
  end_date: DateTime.new(2017, 11, 10),
  title: "Benoît B-Day",
  address: "Paris")

bday_constantin = Event.create(
  start_date: DateTime.new(2017,06, 25),
  end_date: DateTime.new(2017, 06, 25),
  title: "Constantin B-Day",
  address: "Vienna")

bday_gauthier = Event.create(
  start_date: DateTime.new(2017,07, 25),
  end_date: DateTime.new(2017, 07, 25),
  title: "Gauthier B-Day",
  address: "Brussels")

puts "Create Invitations"

Invitation.create(
  event: bday_benoit,
  user: benoit,
  role: "manager"
  )

Invitation.create(
  event: bday_benoit,
  user: gauthier,
  role: "guest"
  )

Invitation.create(
  event: bday_benoit,
  user: const,
  role: "role"
  )


Invitation.create(
  event: bday_constantin,
  user: const,
  role: "manager"
  )

Invitation.create(
  event: bday_constantin,
  user: benoit,
  role: "guest"
  )

Invitation.create(
  event: bday_constantin,
  user: gauthier,
  role: "role"
  )

Invitation.create(
  event: bday_gauthier,
  user: gauthier,
  role: "manager"
  )

Invitation.create(
  event: bday_gauthier,
  user: const,
  role: "guest"
  )

Invitation.create(
  event: bday_gauthier,
  user: benoit,
  role: "role"
  )


