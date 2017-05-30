# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all


puts "Create users"

  benoit = User.create!(
    email: "bg1@mail.com",
    password: "123456",
    first_name: "Benoît",
    last_name: "Habfast")


  gauthier = User.create!(
    email: "bg2@mail.com",
    password: "123456",
    first_name: "Gauthier",
    last_name: "Lagae")

  const = User.create!(
    email: "bg3@mail.com",
    password: "123456",
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

  demo_day = Event.create(
    start_date: DateTime.new(2017,06, 10),
    end_date: DateTime.new(2017, 06, 10),
    title: "Demo Day",
    address: "Lisbon")

puts "Create Invitations"
puts "Invitation Benoit bDay"
  invitation_bday_benoit_benoit= Invitation.create(
    event: bday_benoit,
    user: benoit,
    role: "manager"
    )

  invitation_bday_benoit_gauthier = Invitation.create(
    event: bday_benoit,
    user: gauthier,
    role: "guest"
    )

  invitation_bday_benoit_const = Invitation.create(
    event: bday_benoit,
    user: const,
    role: "guest"
    )

puts "Invitation Const bDay"
  invitation_bday_const_const = Invitation.create(
    event: bday_constantin,
    user: const,
    role: "manager"
    )

  invitation_bday_const_benoit = Invitation.create(
    event: bday_constantin,
    user: benoit,
    role: "guest"
    )

  invitation_bday_const_gauthier = Invitation.create(
    event: bday_constantin,
    user: gauthier,
    role: "guest"
    )

puts "Invitation Gauthier bDay"
  invitation_bday_gauthier_gauthier = Invitation.create(
    event: bday_gauthier,
    user: gauthier,
    role: "manager"
    )

  invitation_bday_gauthier_const = Invitation.create(
    event: bday_gauthier,
    user: const,
    role: "guest"
    )

  invitation_bday_gauthier_benoit = Invitation.create(
    event: bday_gauthier,
    user: benoit,
    role: "guest"
    )

puts "Invitation Demo Day"
  invitation_demo_day_const = Invitation.create(
    event: demo_day,
    user: const,
    role: "manager"
    )

  invitation_demo_day_gauthier = Invitation.create(
    event: demo_day,
    user: gauthier,
    role: "manager"
    )

  invitation_demo_day_benoit = Invitation.create(
    event: demo_day,
    user: benoit,
    role: "manager"
    )


puts "Create Menu Items"
puts "Bday benoit"

  MenuItem.create!(
    name: "Red Wine" ,
    category: "Drink",
    quantity: 2,
    event: bday_benoit,)

  MenuItem.create!(
    name: "Steak",
    category: "Main",
    quantity: 3,
    event: bday_benoit,
    invitation: invitation_bday_benoit_benoit)

  puts "Bday Const"

  MenuItem.create!(
    name: "Beer" ,
    category:"Drink" ,
    quantity: 12,
    event: bday_constantin,)

  MenuItem.create!(
    name: "Pizza",
    category: "Main" ,
    quantity: 4,
    event: bday_constantin,
    invitation: invitation_bday_const_const)

   puts "Bday Gauthier"

  MenuItem.create!(
    name: "Sangria",
    category: "Drink",
    quantity: 2,
    event: bday_gauthier,)

  MenuItem.create!(
    name: "Spaghetti Carbonara",
    category: "Main",
    quantity: 4,
    event: bday_gauthier,
    invitation: invitation_bday_gauthier_gauthier)

  puts "Demo Day"

  MenuItem.create!(
    name: "Beer",
    category: "Drink",
    quantity: 12,
    event: demo_day,)

