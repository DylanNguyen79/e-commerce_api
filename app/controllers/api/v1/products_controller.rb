class Api::V1::ProductsController < ApplicationController
  def create
    product = Product.new(product_params)
    puts ("new")
    puts product.inspect
    variant_count = 1
    vov_count = 1
    variant_ids = []
    option_ids = []
    option_value_ids = []
    params[:options].map do |option|
        opt = Option.create(name: option["name"])
        option_ids.push(opt.id)
        variant_count *= option[:option_values].size
        option[:option_values].map do |opt_val|
            option_value = OptionValue.create(values: opt_val, option_id: opt.id)
            option_value_ids.push(option_value.id)
        end
    end

    variant_count.times do |i|
      variant_ids.push(i + 1)
    end

    vov_count = variant_count * params[:options].size
    vov_count.times do |i|
      VariantOptionValue.create(option_id: option_ids, option_value_id: option_value_ids, variant_id: variant_ids)
    end


    if product.save
        variant_count.times do |i|
        Variant.create(product_id: product.id)
      end
      render json: product, status: :created
    else
      render json: product.errors, status: :unprocessable_entity
    end
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
