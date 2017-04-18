class ImportProducts < ImportCsv

private

  def add_row_to_database(row)
    product = Product.find_or_create_by(id: row[:product_id])
    image = Image.find_or_create_by(url: row[:product_image])

    product.images << image
    product.name = row[:product_name]
    product.description = row[:product_description]
    product.save!
  end
end
