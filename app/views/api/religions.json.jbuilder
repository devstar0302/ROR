json.array! @religions do |religion|
  json.id religion.id
  json.title religion.title
  json.image religion.image

  json.categories religion.categories do |category|
    json.id category.id
    json.title category.title
    json.image category.image

    json.subcategories category.subcategories do |subcategory|
      json.id subcategory.id
      json.title subcategory.title
      json.image subcategory.image

      json.products subcategory.products do |product|
        json.id product.id
        json.model product.model
        json.price product.price
        json.stone product.stone
	json.image product.image
      end
    end
  end
end
