# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create(
  [
    { username: "Dylan", email: "dylan.ong@icloud.com", password: "password" },
    { username: "Changjie", email: "tan7cj@gmail.com", password: "password" },
    { username: "Vince", email: "vince_voo@yahoo.com", password: "password" },
    { username: "Batman", email: "robin@batcave.com", password: "password" },
    { username: "Saypeng", email: "hosaypeng@gmail.com" }
  ]
)

orders = Order.create(
  [
    { user_id: "1", delivered: "false", total_price: "30" },
    { user_id: "2", delivered: "false", total_price: "80" },
    { user_id: "3", delivered: "false", total_price: "150" },
    { user_id: "4", delivered: "false", total_price: "150" },
    { user_id: "5", delivered: "false", total_price: "250" },
    { user_id: "5", delivered: "false", total_price: "350" }
  ]
)

favourites = Favourite.create(
  [
    { product_id: "1", user_id: "1" },
    { product_id: "1", user_id: "2" },
    { product_id: "1", user_id: "3" },
    { product_id: "1", user_id: "5" },
    { product_id: "2", user_id: "1" },
    { product_id: "2", user_id: "2" },
    { product_id: "2", user_id: "3" },
    { product_id: "3", user_id: "1" },
    { product_id: "3", user_id: "2" },
    { product_id: "3", user_id: "3" },
    { product_id: "4", user_id: "5" },
    { product_id: "4", user_id: "4" },
    { product_id: "4", user_id: "3" }

  ]
)

reviews = Review.create(
  [
    { review_text: "this is sooo nice", rating: "5", order_id: "1" },
    { review_text: "I love it!", rating: "5", order_id: "2" },
    { review_text: "OMG super awesome service!", rating: "5", order_id: "3" },
    { review_text: "Fantabulous!", rating: "5", order_id: "4" },
    { review_text: "Niccceee!", rating: "5", order_id: "5" },
    { review_text: "Fantabulous!", rating: "5", order_id: "4" }
  ]
)
