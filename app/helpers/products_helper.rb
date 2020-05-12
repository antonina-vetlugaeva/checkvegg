module ProductsHelper

  def count_products_by_ingridient(ingridient, product)
    product_items = ingridient.product_items.where(product_id: product.id)

    [
      ingridient.name,
      ', ',
    ].join()
  end

  def style_color(product_type)
    case product_type
    when '🍒Подходит веганам'
      'vegan'
    when '🍟Подходит вегетарианцам'
      'vegetarian'
    else
      'non-vegetarian'
    end
  end

  def ingridient_name(product)
    product.ingridients.map { |ingridient| ingridient.name }
  end
end
