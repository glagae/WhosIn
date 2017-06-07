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
    last_name: "Habfast",
    facebook_picture_url:'http://res.cloudinary.com/cehrlicha/image/upload/v1495813639/puracrb2wb9dvtqjmk1l.png')


  gauthier = User.create!(
    email: "bg2@mail.com",
    password: "123456",
    first_name: "Gauthier",
    last_name: "Lagae",
    facebook_picture_url:'http://res.cloudinary.com/cehrlicha/image/upload/v1496240437/avatar_glagae_v4ydf1.jpg')

  const = User.create!(
    email: "bg3@mail.com",
    password: "123456",
    first_name: "Constantin",
    last_name: "Ehrlich-Adam",
    facebook_picture_url: 'http://res.cloudinary.com/cehrlicha/image/upload/v1496240414/constantin_square_heftuu.png')

  viola = User.create!(
      email: "bg4@mail.com",
      password: "123456",
      first_name: "Viola",
      last_name: "Stöckli",
      facebook_picture_url: 'http://res.cloudinary.com/cehrlicha/image/upload/v1495813643/vi2alprrovyd7ttm36aa.png')

  dani = User.create!(
      email: "bg5@mail.com",
      password: "123456",
      first_name: "Daniele",
      last_name: "Silvestre",
      facebook_picture_url: 'http://res.cloudinary.com/cehrlicha/image/upload/v1495813642/ocxnimuzihpmpxb4j1ij.jpg')

  marianna = User.create!(
      email: "bg6@mail.com",
      password: "123456",
      first_name: "Marianna",
      last_name: "Santos",
      facebook_picture_url: 'http://res.cloudinary.com/cehrlicha/image/upload/v1495719744/x0wk4iveoi9l4t4ec2en.jpg')

  gui = User.create!(
      email: "bg7@mail.com",
      password: "123456",
      first_name: "Gui",
      last_name: "Andrade",
      facebook_picture_url: 'http://res.cloudinary.com/cehrlicha/image/upload/v1495631422/lpef07avwf5hwoa5egyj.jpg')

puts "Create Events"

  bday_benoit = Event.create(
    start_date: DateTime.new(2017,11, 10, 19),
    end_date: DateTime.new(2017, 11, 10, 22),
    title: "Benoît B-Day",
    address: "Avenida 24 de Julho, Lisboa",
    free_spots: 4,
    remote_photo_url: "http://res.cloudinary.com/cehrlicha/image/upload/v1496077041/food-salad-restaurant-person_dibjex.jpg" )

  bday_constantin = Event.create(
    start_date: DateTime.new(2017,06, 25, 19, 20),
    end_date: DateTime.new(2017, 06, 25, 23),
    title: "Constantin B-Day",
    address: "Avenida Almirante Reis 1, Lisboa",
    free_spots: 4,
    remote_photo_url: "http://res.cloudinary.com/cehrlicha/image/upload/v1496077041/food-salad-restaurant-person_dibjex.jpg",
    description: "It is time to celebrate come and join me on my birthday! It will be sunny and warm, a fantastic atmosphere with a lot of fun and all my best friends :) Hope to see you soon!")

  bday_gauthier = Event.create(
    start_date: DateTime.new(2017,07, 25, 14),
    end_date: DateTime.new(2017, 07, 25, 22),
    title: "Gauthier B-Day",
    address: "Rua de São Pedro de Alcantara 81, Lisboa",
    free_spots: 4,
    remote_photo_url: "http://res.cloudinary.com/cehrlicha/image/upload/v1496077041/food-salad-restaurant-person_dibjex.jpg",
    description: "Come to Brussels celebrate with me into my new year! There will be free beer at least for the first round. I's on me :) Hope to see you all very soon again !!")

  demo_day = Event.create(
    start_date: DateTime.new(2017,06, 10, 18, 30),
    end_date: DateTime.new(2017, 06, 10, 22),
    title: "Demo Day",
    address: "Rua dos Duques de Bragança 7, Lisboa",
    free_spots: 4,
    remote_photo_url: "http://res.cloudinary.com/cehrlicha/image/upload/v1496077041/food-salad-restaurant-person_dibjex.jpg",
    description: "It is demo day! Time to show off with our work and what we achieved after nine intense weeks in Lisbon, learning to code and enjoying the life. Join us on our final day of an incredible journey!")

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
    role: "guest"
    )

  invitation_demo_day_benoit = Invitation.create(
    event: demo_day,
    user: benoit,
    role: "guest"
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

