# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create!(name: "Luke", movie: movies.first)

REVIEW_COMMENTS = [
  "this is sooo nice",
  "I love it!",
  "OMG super awesome service!",
  "Fantabulous",
  "Niccceee"
]

LineItem.destroy_all
Favourite.destroy_all
Review.destroy_all
Order.destroy_all
ProductCategory.destroy_all
Product.destroy_all
Category.destroy_all
User.destroy_all

require "open-uri"

p "CREATING USERS"

users = User.create!(
  [
    { username: "Dylan", email: "dylan.ong@icloud.com", password: "password" },
    { username: "Changjie", email: "tan7cj@gmail.com", password: "password" },
    { username: "Vince", email: "vince_voo@yahoo.com", password: "password" },
    { username: "Batman", email: "robin@batcave.com", password: "password" },
    { username: "Saypeng", email: "hosaypeng@gmail.com", password: "password" }
  ]
)

p

Category.create!(
  [
    { name: "Art" },
    { name: "Clothing & Shoes" },
    { name: "Jewellery & Accessories" },
    { name: "Toy" },
    { name: "Home & Living" }
  ]
)

p "CREATING PRODUCTS"

products = Product.create!(
  [
    {
      name: "T-Shirt",
      price: 20,
      user: User.all.sample,
      quantity: 10,
      description: "This is a comfortable and stylish T-shirt. Made of 100% cotton and is available in many colors."
    },
    {
      name: "Necklace",
      price: 50,
      user: User.all.sample,
      quantity: 5,
      description: "The best necklace for your partner."
    },
    {
      name: "Duck toy",
      price: 30,
      user: User.all.sample,
      quantity: 15,
      description: "The best duck for your kid."

    },
    {
      name: "Picasso print",
      price: 75,
      user: User.all.sample,
      quantity: 10,
      description: "Affordable art work from the best artist in the world."
    },
    {
      name: "Hat",
      price: 20,
      user: User.all.sample,
      quantity: 5,
      description: "This is a cool hat. It is made of 100% polyester and is available in a variety of colors."
    },
    {
      name: "Grandfather Clock",
      price: 50,
      user: User.all.sample,
      quantity: 10,
      description: "The most authentic grandfather clocks. Tell the time better."
    }
  ]
)

products.each do |product|
  p "ADDING IMAGE"

  file = URI.open("https://source.unsplash.com/featured/?#{product.name}")
  product.photo.attach(io: file, filename: "product#{product.id}.png", content_type: "image/png")
  product.save!

  p "ADDING A CATEGORY TO PRODUCT"

  product.categories << Category.all.sample

  # LineItem.create!(quanity: 4, product: product, order_id: order)
end

p "CREATE FAVORITES"

users.each do |user|
  product = Product.where.not(user: user).first
  Favourite.create(product: product, user: user)
end


p "CREATE ORDERS"

5.times do
  order = Order.new(user: User.all.sample, delivered: "false", total_price: 0)

  number_of_items = rand(1..3)
  products = Product.all.sample(number_of_items)
  number_of_items.times do |index|
    LineItem.create!(quantity: rand(1..5), product: products[index], order: order)
    order.total_price += products[index].price
    order.save!
  end

  p "CREATE REVIEWS"

  Review.create(
    review: REVIEW_COMMENTS.sample,
    rating: rand(5),
    order: order,
    product: order.products.sample
  )
end
