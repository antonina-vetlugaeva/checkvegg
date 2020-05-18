@ingridients = nil
@products = nil
@types = nil

@categories_names = [
  {
    name: 'Молоко, сыр, колбасы',
    products: ['cheese','sausages']
  }, {
    name: 'Напитки',
    products: ['beer', 'wine']
  }, {
    name: 'Бакалея',
    products: ['chocolate', 'icecream']
  }
]

@type_names = ['🍒 Подходит веганам', '🍟 Подходит вегетарианцам', '🐔 Не подходит вегетарианцам']

@ingridient_names = ['milk', 'cream', 'eggs', 'meat', 'fish']

@brands_names = ['vkussvil', 'volko_molko', 'kukuika']


def seed
  reset_db

  create_types(@type_names)
  @types = Type.all

  create_categories(@categories)
  @categories = Category.all

  create_brands(@brands)
  @brands = Brand.all

  create_categories_products
  @products = Product.all

  create_ingridients(@ingridient_names)
  @ingridients = Ingridient.all

  create_products_ingridients

  create_users
  @users = User.all

  create_users_favourites
  @favourites = Favourite.all

  fill_favourites_with_products
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

def create_ingridients(ingridients)
  ingridients.each { |ingridient| create_ingridient(ingridient) }
end

def create_ingridient(ingridient)
  i = Ingridient.create!(name: ingridient)
  puts "Ingridient with name #{i.name} just created"
end

def create_products_ingridients
  @products.each { |product| create_product_ingridients(product) }
end

def create_product_ingridients(product)
  product_ingridients_quantity = (2..@ingridients.count).to_a.sample

  @ingridients.sample(product_ingridients_quantity).each do |ingridient|
    create_product_ingridient(product, ingridient)
  end
end

def create_product_ingridient(product, ingridient)
  pi = IngridientsProducts.create!(product_id: product.id, ingridient_id: ingridient.id)
  puts "Product ingridient just created with id#{pi.id} for product with id#{pi.product.id} for ingridient with id #{pi.ingridient.id}"
end

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

def create_brands(brands)
  @brands_names.each do |brand|
    create_brand(brand)
  end
end

def create_brand(brand)
  b = Brand.create!(name: brand[:name])
  puts "Brand with name #{b.name}"
end

def create_brands_products(brand, products)
  products.each { |product| create_brand_product(brand, product) }
end

def create_brand_product(brand, product)
  p = brand.products.create!(name: product)
  puts "Product with name #{p.name} with type #{p.type.name} just created in brand with name #{p.brand.name}"
end


seed
