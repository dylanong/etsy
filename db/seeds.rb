# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



ProductCategory.destroy_all
Category.destroy_all
Product.destroy_all
User.destroy_all

require "open-uri"

p "CREATING USERS"

users = User.create(
  [
    { username: "Dylan", email: "dylan.ong@icloud.com", password: "password" },
    { username: "Changjie", email: "tan7cj@gmail.com", password: "password" },
    { username: "Vince", email: "vince_voo@yahoo.com", password: "password" },
    { username: "Batman", email: "robin@batcave.com", password: "password" },
    { username: "Saypeng", email: "hosaypeng@gmail.com", password: "password" }
  ]
)

p "CREATING CATEGORIES"

categories = Category.create(
  [
    { name: "Art" },
    { name: "Clothing & Shoes" },
    { name: "Jewellery & Accessories" },
    { name: "Toy" },
    { name: "Home & Living" }
  ]
)

p "CREATING PRODUCTS"

products = Product.create(
  [
    {
      name: "T-Shirt",
      price: 20,
      user_id: 1,
      quantity: 10,
      description: "This is a comfortable and stylish T-shirt. Made of 100% cotton and is available in many colors."
    },
    {
      name: "Necklace",
      price: 50,
      user_id: 2,
      quantity: 5,
      description: "The best necklace for your partner."
    },
    {
      name: "Duck toy",
      price: 30,
      user_id: 4,
      quantity: 15,
      description: "The best duck for your kid."

    },
    {
      name: "Picasso print",
      price: 75,
      user_id: 3,
      quantity: 10,
      description: "Affordable art work from the best artist in the world."
    },
    {
      name: "Hat",
      price: 20,
      user_id: 5,
      quantity: 5,
      description: "This is a cool hat. It is made of 100% polyester and is available in a variety of colors."
    },
    {
      name: "Grandfather Clock",
      price: 50,
      user_id: 1,
      quantity: 10,
      description: "The most authentic grandfather clocks. Tell the time better."
    }
  ]
)

products.each do |product|
  p "ADDING IMAGE"

  file = URI.open("https://source.unsplash.com/featured/?#{product.name}")
  product.photo.attach(io: file, filename: "product#{product.id}.png", content_type: "image/png")
  product.save

  p "ADDING A CATEGORY TO PRODUCT"

  products.categories << Category.all.sample
  product.save

  # LineItem.create(quanity: 4, product: product, order_id: order)
end




return

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
    { user: users[0], delivered: "false", total_price: "30" },
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

products = Product.create(
  [
    {
      name: "T-Shirt",
      price: 20,
      user_id: 1,
      quantity: 10,
      description: "This is a comfortable and stylish T-shirt. Made of 100% cotton and is available in many colors."
    },
    {
      name: "Necklace",
      price: 50,
      user_id: 2,
      quantity: 5,
      description: "The best necklace for your partner."
    },
    {
      name: "Duck toy",
      price: 30,
      user_id: 4,
      quantity: 15,
      description: "The best duck for your kid."

    },
    {
      name: "Picasso print",
      price: 75,
      user_id: 3,
      quantity: 10,
      description: "Affordable art work from the best artist in the world."
    },
    {
      name: "Hat",
      price: 20,
      user_id: 5,
      quantity: 5,
      description: "This is a cool hat. It is made of 100% polyester and is available in a variety of colors."
    },
    {
      name: "Grandfather Clock",
      price: 50,
      user_id: 1,
      quantity: 10,
      description: "The most authentic grandfather clocks. Tell the time better."
    }
  ]
)

products.each do |product|
  file = URI.open("https://source.unsplash.com/featured/?#{name}")
  product.photo.attach(io: file, filename: "product#{product.id}.png", content_type: "image/png")
  product.save

  # LineItem.create(quanity: 4, product: product, order_id: order)
end

category.create(
  [
    { name: "Art" },
    { name: "Clothing & Shoes" },
    { name: "Jewellery & Accessories" },
    { name: "Toy" },
    { name: "Home & Living" }
  ]
)

line_items.create(
  [
    { quantity: 4, product_id: "#{product_id}", order_id: "" },
    { quantity: 5, product_id: "#{product_id}", order_id: "" },
    { quantity: 10, product_id: "#{product_id}", order_id: "" },
    { quantity: 20, product_id: "#{product_id}", order_id: "" },
    { quantity: 25, product_id: "#{product_id}", order_id: "" }
  ]
)
