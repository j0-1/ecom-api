require 'csv'

class ImportVariants < ImportCsv

private

  def add_row_to_database(row)
    product = Product.find_by(id: row[:product_id])
    return product_error(row[:product_id]) unless product

    variant =
      Variant.find_or_create_by(product_id: row[:product_id], waist: row[:waist],
                                length: row[:length], style: row[:style])
    variant.inventory_count = row[:count]

    product.variants << variant
    product.save!
  end

  def product_error(product_id)
    errors.add(:filename, "Variant for unknown product #{product_id} found.")
  end
end
