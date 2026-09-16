class Api::V1::ProductsController < ApplicationController
  def create
    product = Product.create(product_params)

    puts ("new")
    puts product.inspect
    variant_count = 1
    variant_ids = []
    option_ids = []
    option_value_ids = []
    option_value_group = []
    vov_arr = []
    params[:options].map do |option|
        opt = Option.create(name: option["name"])
        option_ids.push(opt.id)

        variant_count *= option[:option_values].size

        option_value_ids = []
        option[:option_values].map do |opt_val|
            option_value = OptionValue.create(values: opt_val, option_id: opt.id)
            option_value_ids.push(option_value.id)
        end
        option_value_group.push(option_value_ids)
    end

    variant_count.times do |i|
        variant = Variant.create(product_id: product.id)
        variant_ids.push(variant.id)
    end
    puts ("variant_ids")
    puts (variant_ids)
    puts ("option_ids")
    puts (option_ids)
    puts ("option_value_ids")
    puts (option_value_ids)
    puts ("option_value_group")
    puts (option_value_group)
    puts ("option_value_ids.size")
    puts (option_value_ids.size)
    puts ("option_value_group.flatten")
    puts (option_value_group.flatten)

    option_value_group.each_with_index do |opt_val, j|
      t = variant_ids.size / opt_val.size
      t.times do |x|
        opt_val.each do |z|
          vov_arr.push(option_id: option_ids[j], option_value_id: z)
        end
      end
    end
    vov_arr.each_with_index do |var, i|
      vov_arr[i][:variant_id] = variant_ids[i % variant_ids.size]
    end
    puts "VarientOptionValue ---> #{vov_arr}"

    vov_arr.each do |vov|
        VariantOptionValue.create!(
            variant_id: vov[:variant_id],
            option_id: vov[:option_id],
            option_value_id: vov[:option_value_id]
        )
    end

    render plain: "ok"
  end

  private

  def product_params
    params.require(:product).permit(
      :title,
      :description,
      :price,
      :category_id,
      :image_url
    )
  end
end
