namespace :import do
  desc "Import a products.csv file"
  task :products, [:filename] => [:environment] do |task, args|
    puts "Importing products from the file #{args.filename}"

    prods = ImportProducts.new(args.filename)
    if prods.import
      puts "Success!"
    else
      puts "Errors #{prods.errors.full_messages}"
    end
  end

  desc "Import a inventory.csv file"
  task :inventory, [:filename] => [:environment] do |task, args|
    puts "Importing inventory from the file #{args.filename}"

    variants = ImportVariants.new(args.filename)
    if variants.import
      puts "Success!"
    else
      puts "Errors #{variants.errors.full_messages}"
    end
  end
end
