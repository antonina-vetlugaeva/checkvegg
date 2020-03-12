json.extract! product_item, :id, :product_id, :category_id, :ingridient_id, :created_at, :updated_at
json.url product_item_url(product_item, format: :json)
