# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
jake = Guest.create(name: "Jake")
chat = Chat.new(message: "Hello, there", img: "https://cdn.pixabay.com/photo/2015/05/28/23/12/auto-788747__480.jpg", like: 0, laugh: 0, angry: 0)
jake.chats.push(chat)
jake.save

