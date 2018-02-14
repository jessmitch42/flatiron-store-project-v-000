10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

User.create(email:"jessica@jessica.com", password:"123456", password_confirmation:"123456")
User.create(email:"phil@phil.com", password:"123456", password_confirmation:"123456")

User.create(email:"jen@jen.com", password:"123456", password_confirmation:"123456")
