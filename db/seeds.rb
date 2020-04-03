#@ingridients = nil
@products = nil
@product_items = nil
@types = nil
@users = nil
@favourite_items = nil

@users_names = ['Tonya', 'Masha', 'Liza']

@categories_names = [
  {
    name: 'milk_cheese_sausages',
    products: ['cheese','sausages']
  }, {
    name: 'alcohol',
    products: ['beer', 'wine']
  }, {
    name: 'sweets',
    products: ['chocolate', 'icecream']
  }
]

@type_names = ['vegan', 'vegetarian', 'nonvegetarian']

#@ingridient_names = ['milk', 'cream', 'eggs', 'meat', 'fish']


def seed
  reset_db

  create_types(@type_names)
  @types = Type.all

  create_categories(@categories)
  @categories = Category.all

  create_categories_products
  @products = Product.all

  #create_ingridients(@ingridient_names)
  #@ingridients = Ingridient.all

  create_products_ingridients
  create_products_items
  @product_items = ProductItem.all
  #ИНГРИДИЕНТЫ – ДЖОЙН МОДЕЛЬ

  create_users
  @users = User.all

  create_users_favourite_items
  @favourite_items = Favourite_items.all
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_types(types)
  types.each { |type| create_type(type) }
end

def create_type(type)
  t = Type.create!(name: type)
  puts "Type with name #{t.name} just created"
end

def create_types_products

end

#def create_ingridients(ingridients)
#  ingridients.each { |ingridient| create_ingridient(ingridient) }
#end

#def create_ingridient(ingridient)
#  i = Ingridient.create!(name: ingridient)
#  puts "Ingridient with name #{i.name} just created"
#end

#def create_products_ingridients
#  @products.each { |product| create_product_ingridients(product) }
#end

#def create_product_ingridients(product)
#  product_ingridients_quantity = (2..@ingridients.count).to_a.sample

#  @ingridients.sample(product_ingridients_quantity).each do |ingridient|
#    create_product_ingridient(product, ingridient)
#  end
#end

def create_categories(categories)
  @categories_names.each do |category|
    create_category(category)
  end
end

def create_category(category)
  c = Category.create!(name: category[:name])
  puts "Category with name #{c.name}"
end

def create_categories_products
  @categories.each do |category|
    @categories_names.each do |category_name_with_product_list|
      if category.name == category_name_with_product_list[:name]
        create_category_products(category, category_name_with_product_list[:products])
      end
    end
  end
end

def create_category_products(category, products)
  products.each { |product| create_category_product(category, product) }
end

def create_category_product(category, product)
  p = category.products.create!(name: product, type_id: @types.sample.id)
  puts "Product with name #{p.name} with type #{p.type.name} just created in category with name #{p.category.name}"
end



#def create_product_ingridient(product, ingridient)
#  pi = IngridientsProducts.create!(product_id: product.id, ingridient_id: ingridient.id)
#  puts "Product ingridient just created with id#{pi.id} for product with id#{pi.product.id} for ingridient with id #{pi.ingridient.id}"
#end

#def create_products_items
#  @products.each { |product| create_product_items (product) }
#end

#def create_product_items (product)
  #нужно пройтись по всем категориям  продукта, и для них создать айтемы
#  product.ingridients.each do |ingridient|
#    quantity = (2..10).to_a.sample
    #берем случайное число
#    quantity.times { create_product_item(product, ingridient) }
    #какое-то количество раз запускаем метод, для каждого ингридиента создаем айтемы от 2 до 10 штук
#  end

#end

#def create_product_item(product, ingridient)
#   serial_number = SecureRandom.uuid
#   product_item = product.product_items.create!(ingridient_id: ingridient.id, serial_number: serial_number)
#   puts "Product Item just created with id #{ product_item.id } for product with id #{ product_item.product.id } with ingridient with id #{ product_item.ingridient.id }"
# end
#
# def create_users
#   @users_names.each { |user_name| puts "User just created with id #{ User.create!(name: user_name).id }" }
# end
#
# def create_users_favourites
#   @users.each { |user| create_user_favourite(user) }
# end
#
# def create_user_favourite(user)
#   favourite = user.favourites.create!
#   puts "Favourite just created with id #{ favourite.id } for user with id #{ favourite.user.id }"
# end
#
# def fill_favourites_with_products
#   @favourites.each { |favourite| fill_favourite_with_products(favourite) }
# end
#
# def fill_favourite_with_products(favourite)
#   quantity = (1..20).to_a.sample
#   #взять из продукт айтемс столько продуктов, сколько сгенериться выше, и положить в избранные
#   product_items = @product_items.sample(quantity)
#
#   product_items.each { |product_item| create_favourite_item(favourite, product_item) }
# end
#
# def create_favourite_item(favourite, product_item)
#   product = product_item.product
#   favourite_item = FavouriteItem.create!(favourite_id: favourite.id, product_id: product.id, product_item_id: product_item.id )
#   puts "Favourite Item just created with id #{ favourite_item.id } for product with id #{ favourite_item.product.id } for product item with id #{ favourite_item.product_item.id }"
# end

seed
