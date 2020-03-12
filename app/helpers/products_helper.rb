module ProductsHelper

  def count_products_by_ingridient(ingridient, product)
    product_items = ingridient.product_items.where(product_id: product.id)

    [
      ingridient.name,
      ', ',
    ].join()
  end

end
