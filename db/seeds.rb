# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([Star Wars" }, Lord of the Rings" }])
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

p "CREATING CATEGORIES"

# Category.create!(
#   [
#     Art" },
#     Clothing & Shoes" },
#     Jewellery & Accessories" },
#     { name: "Toy" },
#     { name: "Home & Living" }
#   ]
# )

Category.create!(
  [
    {name: "Jewellery & Accessories"},
    {name: "Clothing & Shoes"},
    {name: "Home & Living"},
    {name: "Wedding & Party"},
    {name: "Toys & Entertainment"},
    {name: "Art & Collecibles"},
    {name: "Craft Supplies & Tools"},
    {name: "Vintage"},
    {name: "Accessories", parent_id: 1},
    {name: "Bags & Purses", parent_id: 1},
    {name: "Necklaces", parent_id: 1},
    {name: "Rings", parent_id: 1},
    {name: "Earrings", parent_id: 1},
    {name: "Bracelets", parent_id: 1},
    {name: "Body Jewellery", parent_id: 1},
    {name: "Hats & Caps", parent_id: 9},
    {name: "Hair Accessories", parent_id: 9},
    {name: "Sunglasses & Eyewear", parent_id: 9},
    {name: "Scarves & Wraps", parent_id: 9},
    {name: "Belts & Braces", parent_id: 9},
    {name: "Keychains & Lanyards", parent_id: 9},
    {name: "Cosmetic & Toiletry Bags", parent_id: 9},
    {name: "Gloves & Mittens", parent_id: 9},
    {name: "Umbrellas & Rain Accessories", parent_id: 9},
    {name: "Wallets & Money Clips", parent_id: 9},
    {name: "Baseball & Trucker Hats", parent_id: 16},
    {name: "Beanies & Winter Hats", parent_id: 16},
    {name: "Sun Hats", parent_id: 16},
    {name: "Headbands", parent_id: 17},
    {name: "Fascinators & Mini Hats", parent_id: 17},
    {name: "Hairslides & Clips", parent_id: 17},
    {name: "Ties & Elastics", parent_id: 17},
    {name: "Wreaths & Tiaras", parent_id: 17},
    {name: "Backpacks", parent_id: 10},
    {name: "Handbags", parent_id: 10},
    {name: "Nappy Bags", parent_id: 10},
    {name: "Luggage & Duffel Bags", parent_id: 10},
    {name: "Phones Cases", parent_id: 10},
    {name: "Totes", parent_id: 10},
    {name: "Clutches & Evening Bags", parent_id: 35},
    {name: "Shoulder Bags", parent_id: 35},
    {name: "Pendants", parent_id: 11},
    {name: "Chokers", parent_id: 11},
    {name: "Charm Necklaces", parent_id: 11},
    {name: "Crystal Necklaces", parent_id: 11},
    {name: "Monogram & Name Neckalces", parent_id: 11},
    {name: "Beaded Necklaces", parent_id: 11},
    {name: "Chains", parent_id: 11},
    {name: "Bib Necklaces", parent_id: 11},
    {name: "Tassel Necklaces", parent_id: 11},
    {name: "Stackable Rings", parent_id: 12},
    {name: "Statement Rings", parent_id: 12},
    {name: "Bands", parent_id: 12},
    {name: "Signet Rings", parent_id: 12},
    {name: "Multi-Stone Rings", parent_id: 12},
    {name: "Solitaire Rings", parent_id: 12},
    {name: "Midi Rings", parent_id: 12},
    {name: "Wedding & Engagement", parent_id: 12},
    {name: "Engagement Rings", parent_id: 58},
    {name: "Wedding Bands", parent_id: 58},
    {name: "Promise Rings", parent_id: 58},
    {name: "Bridal Sets", parent_id: 58},
    {name: "Dangle & Drop Earrings", parent_id: 13},
    {name: "Stud Earrings", parent_id: 13},
    {name: "Hoop Earrrings", parent_id: 13},
    {name: "Chandeller Earrings", parent_id: 13},
    {name: "Ear Jackets & Climbers", parent_id: 13},
    {name: "Cluster Earrings ", parent_id: 13},
    {name: "Cuff & Wrap Earrings", parent_id: 13},
    {name: "Clip-On Earrings", parent_id: 13},
    {name: "Beaded Bracelets", parent_id: 14},
    {name: "Bangles", parent_id: 14},
    {name: "Charm Bracelets", parent_id: 14},
    {name: "Woven & Braided Bracelets", parent_id: 14},
    {name: "Cuff Bracelets", parent_id: 14},
    {name: "Chain & Link Bracelets", parent_id: 14},
    {name: "Anklets", parent_id: 15},
    {name: "Hair Jewellery", parent_id: 15},
    {name: "Nose Rings & Studs", parent_id: 15},
    {name: "Arm Bands", parent_id: 15},
    {name: "Nipple Jewellery", parent_id: 15},
    {name: "Belly Rings", parent_id: 15},
    {name: "Shoulder Jewellery", parent_id: 15},
    {name: "Toe Rings", parent_id: 15},
    {name: "Lip Rings", parent_id: 15},
    {name: "Women's", parent_id: 2},
    {name: "Men's", parent_id: 2},
    {name: "Kid's & Baby", parent_id: 2},
    {name: "Women's Clothing", parent_id: 86},
    {name: "Women's Shoes", parent_id: 86},
    {name: "Dresses", parent_id: 89},
    {name: "Tops & Tees", parent_id: 89},
    {name: "Skirts", parent_id: 89},
    {name: "Jackets & Coats", parent_id: 89},
    {name: "Trousers & Capris", parent_id: 89},
    {name: "Jumpers", parent_id: 89},
    {name: "Costumes", parent_id: 89},
    {name: "Hoodies & Sweatshirts", parent_id: 89},
    {name: "Pyjamas & Robes", parent_id: 89},
    {name: "Shorts", parent_id: 89},
    {name: "Swimwear", parent_id: 89},
    {name: "Boots", parent_id: 90},
    {name: "Sandals", parent_id: 90},
    {name: "Slippers", parent_id: 90},
    {name: "Trainers", parent_id: 90},
    {name: "Men's Clothing", parent_id: 87},
    {name: "Men's Shoes", parent_id: 87},
    {name: "Shirts", parent_id: 106},
    {name: "Jumpers", parent_id: 106},
    {name: "Costumes", parent_id: 106},
    {name: "Hoodies & Sweatshirts", parent_id: 106},
    {name: "Jackets & Coats", parent_id: 106},
    {name: "Pyjamas & Robes", parent_id: 106},
    {name: "Shorts", parent_id: 106},
    {name: "Boots", parent_id: 107},
    {name: "Slippers", parent_id: 107},
    {name: "Trainers", parent_id: 107},
    {name: "Baby Girls's Clothing", parent_id: 88},
    {name: "Girl's Clothing", parent_id: 88},
    {name: "Baby Boy's Clothing", parent_id: 88},
    {name: "Boy's Clothing", parent_id: 88},
    {name: "Girl's Shoes", parent_id: 88},
    {name: "Boy's Shoes", parent_id: 88},
    {name: "Gender-Neutral Baby Clothing", parent_id: 88},
    {name: "Gender-Neutral Kid's Clothing", parent_id: 88},
    {name: "Jumpers", parent_id: 118},
    {name: "Dresses", parent_id: 119},
    {name: "Skirts", parent_id: 119},
    {name: "Tops", parent_id: 119},
    {name: "Costumes", parent_id: 119},
    {name: "Jackets & Coats", parent_id: 119},
    {name: "Jumpers", parent_id: 119},
    {name: "Pyjamas & Robes", parent_id: 119},
    {name: "Jumpers", parent_id: 120},
    {name: "Tops", parent_id: 121},
    {name: "Costumes", parent_id: 121},
    {name: "Jackets & Coats", parent_id: 121},
    {name: "Jumpers", parent_id: 121},
    {name: "Pyjamas & Robes", parent_id: 121},
    {name: "Boots", parent_id: 122},
    {name: "Slippers", parent_id: 122},
    {name: "Trainers", parent_id: 122},
    {name: "Boots", parent_id: 123},
    {name: "Slippers", parent_id: 123},
    {name: "Trainers", parent_id: 123},
    {name: "Home", parent_id: 3},
    {name: "Bath & Beauty", parent_id: 3},
    {name: "Pet Supplies", parent_id: 3},
    {name: "Home Decor", parent_id: 146},
    {name: "Rugs", parent_id: 146},
    {name: "Furniture", parent_id: 146},
    {name: "Bedding", parent_id: 146},
    {name: "Bathroom", parent_id: 146},
    {name: "Outdoor & Gardening", parent_id: 146},
    {name: "Storage & Organisation", parent_id: 146},
    {name: "Office", parent_id: 146},
    {name: "Lighting", parent_id: 146},
    {name: "Kitchen & Dining", parent_id: 146},
    {name: "Food & Drink", parent_id: 146},
    {name: "Spirituality & Religion", parent_id: 146},
    {name: "Wall Decor", parent_id: 149},
    {name: "Decorative Cushions", parent_id: 149},
    {name: "Picture Frames & Displays", parent_id: 149},
    {name: "Candeles & Holders", parent_id: 149},
    {name: "Clocks", parent_id: 149},
    {name: "Vases", parent_id: 149},
    {name: "Bedroom Furniture", parent_id: 151},
    {name: "Dining Room Furniture", parent_id: 151},
    {name: "Kid's Furniture", parent_id: 151},
    {name: "Living Room Furniture", parent_id: 151},
    {name: "Cookware", parent_id: 158},
    {name: "Drink & Barware", parent_id: 158},
    {name: "Serveware", parent_id: 158},
    {name: "Bath Accessories", parent_id: 147},
    {name: "Makeup & Cosmetics", parent_id: 147},
    {name: "Skin Care", parent_id: 147},
    {name: "Hair Care", parent_id: 147},
    {name: "Essential Oils", parent_id: 147},
    {name: "Fragrances", parent_id: 147},
    {name: "Soaps & Bath Bombs", parent_id: 147},
    {name: "Sex Toys", parent_id: 147},
    {name: "Face Masks & Coverings", parent_id: 147},
    {name: "Spa Kits & Gifts", parent_id: 147},
    {name: "Pet Collars & Leashes", parent_id: 148},
    {name: "Pet Furniture", parent_id: 148},
    {name: "Pet Clothing & Shoes", parent_id: 148},
    {name: "Pet Bedding", parent_id: 148},
    {name: "Pet Carriers & Houses", parent_id: 148},
    {name: "Pet Jackets & Hoodies", parent_id: 186},
    {name: "Party Supplies", parent_id: 4},
    {name: "Invitations & Paper", parent_id: 4},
    {name: "Wedding Decorations", parent_id: 4},
    {name: "Wedding Gifts", parent_id: 4},
    {name: "Wedding Accessories", parent_id: 4},
    {name: "Wedding Cloathing", parent_id: 4},
    {name: "Wedding Jewellery", parent_id: 4},
    {name: "Party Décor", parent_id: 190},
    {name: "Baking & Cake Decoration", parent_id: 190},
    {name: "Invitations & Announcements", parent_id: 191},
    {name: "Greeting Cards", parent_id: 191},
    {name: "Gift Wrapping", parent_id: 191},
    {name: "Christmas & Seasonal Cards", parent_id: 191},
    {name: "Stationery", parent_id: 191},
    {name: "Wedding Invitations", parent_id: 199},
    {name: "Wedding Invitations Kits", parent_id: 199},
    {name: "Wedding Templates", parent_id: 199},
    {name: "Save The Dates", parent_id: 199},
    {name: "Centrepieces", parent_id: 192},
    {name: "Cake Toppers", parent_id: 192},
    {name: "Serving & Dining", parent_id: 192},
    {name: "Candles & Holders", parent_id: 192},
    {name: "Baskets & Boxes", parent_id: 192},
    {name: "Ring Bearer Pillows", parent_id: 192},
    {name: "Plants", parent_id: 192},
    {name: "Cake Servers & Knives", parent_id: 210},
    {name: "Table Décor", parent_id: 210},
    {name: "Bridesmaids Gifts", parent_id: 193},
    {name: "Wedding Favours", parent_id: 193},
    {name: "Gifts For The Couple", parent_id: 193},
    {name: "Best Men Gifts", parent_id: 193},
    {name: "Guest Books", parent_id: 193},
    {name: "Portraits & Frames", parent_id: 193},
    {name: "Albums & Scrapbooks", parent_id: 193},
    {name: "Something Blue", parent_id: 194},
    {name: "Bouquets & Corsages", parent_id: 194},
    {name: "Veils", parent_id: 194},
    {name: "Cover Ups & Scarves", parent_id: 194},
    {name: "Hair Accessories", parent_id: 194},
    {name: "Cummerbunds", parent_id: 194},
    {name: "Neckties", parent_id: 194},
    {name: "Umbrellas", parent_id: 194},
    {name: "Hats", parent_id: 194},
    {name: "Hairslides & Clips", parent_id: 228},
    {name: "Decorative Combs", parent_id: 228},
    {name: "Fascinators & Mini Hats", parent_id: 228},
    {name: "Hair Jewellery", parent_id: 228},
    {name: "Hair Pins", parent_id: 228},
    {name: "Wreaths & Tiaras", parent_id: 228},
    {name: "Dresses", parent_id: 195},
    {name: "Lingerie & Garters", parent_id: 195},
    {name: "Suits", parent_id: 195},
    {name: "Bridal Gowns & Separates ", parent_id: 239},
    {name: "Bridesmaid Dresses", parent_id: 239},
    {name: "Flower Girl Dresses", parent_id: 239},
    {name: "Mother of the Bride Dresses", parent_id: 239},
    {name: "Earrings", parent_id: 196},
    {name: "Rings", parent_id: 196},
    {name: "Necklaces", parent_id: 196},
    {name: "Bracelets", parent_id: 196},
    {name: "Jewellery Sets", parent_id: 196},
    {name: "Engagement Rings", parent_id: 247},
    {name: "Wedding Bands", parent_id: 247},
    {name: "Bridal Sets", parent_id: 247},
    {name: "Toys & Games", parent_id: 5},
    {name: "Electronics & Accessories", parent_id: 5},
    {name: "Books", parent_id: 5},
    {name: "Movies & Music", parent_id: 5},
    {name: "Baby & Toddler Toys", parent_id: 254},
    {name: "Dolls & Action Figures", parent_id: 254},
    {name: "Stuffed Animals", parent_id: 254},
    {name: "Games & Puzzles", parent_id: 254},
    {name: "Learning & School", parent_id: 254},
    {name: "Kids' Crafts", parent_id: 254},
    {name: "Slime & Foam", parent_id: 254},
    {name: "Sports & Outdoor Games", parent_id: 254},
    {name: "Mobile Phone Accessories", parent_id: 255},
    {name: "Gadgets", parent_id: 255},
    {name: "Video Games", parent_id: 255},
    {name: "Decals & Skins", parent_id: 255},
    {name: "Cameras", parent_id: 255},
    {name: "Computers & Peripherals", parent_id: 255},
    {name: "Car Parts & Accessories", parent_id: 255},
    {name: "Docks & Stands", parent_id: 255},
    {name: "Electronics Cases", parent_id: 255},
    {name: "Blank Books", parent_id: 256},
    {name: "Calenders & Planners", parent_id: 256},
    {name: "Book Accessories", parent_id: 256},
    {name: "Children's Booiks", parent_id: 256},
    {name: "Art & Photography Books", parent_id: 256},
    {name: "Comics & Graphic Novels Craft &  Hobby Books", parent_id: 256},
    {name: "Literature & Ficiton", parent_id: 256},
    {name: "Poetry", parent_id: 256},
    {name: "Guides & How Tos", parent_id: 256},
    {name: "Zines & Magazines", parent_id: 256},
    {name: "Musical Instruments", parent_id: 257},
    {name: "Instrument Straps", parent_id: 257},
    {name: "Recorded Audio", parent_id: 257},
    {name: "Sheet Music", parent_id: 257},
    {name: "All Movies", parent_id: 257},
    {name: "All Music", parent_id: 257},
    {name: "Pick & Slides", parent_id: 257},
    {name: "Prints", parent_id: 6},
    {name: "Photography", parent_id: 6},
    {name: "Painting", parent_id: 6},
    {name: "Sculpture", parent_id: 6},
    {name: "Glass Art", parent_id: 6},
    {name: "Drawing & Illustration", parent_id: 6},
    {name: "Mixed Media & Collage", parent_id: 6},
    {name: "Fibre Arts", parent_id: 6},
    {name: "Dolls & Miniatures", parent_id: 6},
    {name: "Collectibles", parent_id: 6},
    {name: "Oil", parent_id: 294},
    {name: "Watercolour", parent_id: 294},
    {name: "Acrylic", parent_id: 294},
    {name: "Figurines & Knick Knacks", parent_id: 301},
    {name: "Memorabilia", parent_id: 301},
    {name: "Coins & Money", parent_id: 301},
    {name: "Home & Hobby", parent_id: 7},
    {name: "Jewellery & Beauty", parent_id: 7},
    {name: "Sewing & Fibre", parent_id: 7},
    {name: "Papercraft", parent_id: 7},
    {name: "Visual Arts", parent_id: 7},
    {name: "Sculpting & Forming", parent_id: 7},
    {name: "Woodworking & Carpentry", parent_id: 308},
    {name: "Home Improvement", parent_id: 308},
    {name: "Electronics & Circuitry", parent_id: 308},
    {name: "Framing", parent_id: 308},
    {name: "Doll & Model Making", parent_id: 308},
    {name: "Candle Making", parent_id: 308},
    {name: "Food & Fermenting", parent_id: 308},
    {name: "Floral & Garden Crafts", parent_id: 308},
    {name: "Gardening & Plants", parent_id: 321},
    {name: "Floral Arranging", parent_id: 321},
    {name: "Jewellery Making & Beading", parent_id: 309},
    {name: "Makeup & Face Painting", parent_id: 309},
    {name: "Beads", parent_id: 324},
    {name: "Cabochons", parent_id: 324},
    {name: "Charms", parent_id: 324},
    {name: "Jewellery Findings", parent_id: 324},
    {name: "Pendants", parent_id: 324},
    {name: "Knitting", parent_id: 310},
    {name: "Crochet", parent_id: 310},
    {name: "Sewing", parent_id: 310},
    {name: "Quilting", parent_id: 310},
    {name: "Embroidery", parent_id: 310},
    {name: "Cross Stitch", parent_id: 310},
    {name: "Card Making & Stationery", parent_id: 311},
    {name: "Scrapbooking", parent_id: 311},
    {name: "Bookbinding", parent_id: 311},
    {name: "Stamping", parent_id: 311},
    {name: "Origami", parent_id: 311},
    {name: "Party & Gifting", parent_id: 311},
    {name: "Painting", parent_id: 312},
    {name: "Printing & Printmaking", parent_id: 312},
    {name: "Drawing & Drafting", parent_id: 312},
    {name: "Photography", parent_id: 312},
    {name: "Collage", parent_id: 312},
    {name: "Caligraphy & Pens", parent_id: 312},
    {name: "Ceramics & Petry", parent_id: 313},
    {name: "Metalworking", parent_id: 313},
    {name: "Carving & Whittling", parent_id: 313}
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
    },

    {
      name: "Lego Pagani",
      price: 50,
      user: User.all.sample,
      quantity: 10,
      description: "Cool italian style sports car made from lego bricks."
    },

    {
      name: "Maharishi Cave Tent",
      price: 50,
      user: User.all.sample,
      quantity: 10,
      description: "The camping gear for the great outdoors"
    }
  ]
)

products.each do |product|
  p "ADDING IMAGE"

  file = URI.open("https://source.unsplash.com/featured/?#{product.name}")
  product.photo.attach(io: file, filename: "product#{product.id}.png", content_type: "image/png")
  product.save!

  p "ADDING A CATEGORY TO PRODUCT"

  product.categories << Category.all_root_categories.sample

  # LineItem.create!(quantity: 4, product: product, order_id: order)
end

p "CREATE FAVORITES"

users.each do |user|
  product = Product.where.not(user: user).first
  Favourite.create(product: product, user: user)
end


p "CREATE ORDERS"

50.times do
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
