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
    params[:options].map do |option|
        opt = Option.create!(name: option["name"])
        option_ids.push(opt.id)

        variant_count *= option[:option_values].size

        option_value_ids = []
        option[:option_values].map do |opt_val|
            option_value = OptionValue.create!(values: opt_val, option_id: opt.id)
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

    combination = option_value_group[0].product(option_value_group[1])

    combination.each_with_index do |option_values, index|
      variant_id = variant_ids[index]

      option_values.each_with_index do |option_value_id, option_index|
        option_id = option_ids[index]

        puts ("option_id")
        puts (option_id)
        variant_option_value = VariantOptionValue.create!(
            variant_id: variant_id,
            option_id: option_id,
            option_value_id: option_value_id
        )

        puts (variant_option_value.inspect)
      end
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
