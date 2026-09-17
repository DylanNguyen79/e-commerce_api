class Api::V1::ProductsController < ApplicationController
    def index
      render json: Product.all, status: :ok
    end

    def show
      product = Product.find_by(id: params[:id])

      if product
        render json: product, status: :ok
      else
        render json: { message: "Product not found" }, status: :not_found
      end
    end

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

    # Get Option ID && Option Value ID
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

    params[:variants].each do |variant|
        variant = Variant.create(
            product_id: product.id,
            sku: variant[:sku],
            stock: variant[:stock],
            variant_price: variant[:variant_price],
        )
        variant_ids.push(variant.id)
    end

    # # Get Variant ID
    # variant_count.times do |i|
    #     variant = Variant.create(
    #         product_id: product.id,
    #         sku:
    #         price: product.price
    #         stock:
    #         )
    #     variant_ids.push(variant.id)
    # end

    # Create data for VariantOptionValue
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

    vov_arr.each do |vov|
        VariantOptionValue.create(
            variant_id: vov[:variant_id],
            option_id: vov[:option_id],
            option_value_id: vov[:option_value_id]
        )
    end

    render json: product, status: :created
    end

  def update
    product = Product.find_by(id: params[:id])

    if product && product.update(product_params)
        render json: { message: "Successfully" }, status: :ok
    else
        render json: { message: "Product not found or Update failed" }, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])

    if product.nil?
        render json: { message: "Product not exist" }, status: :not_found
    elsif product.destroy
        render json: { message: "Deleted product" }, status: :ok
    else
        render json: { message: "Product not found" }, status: :unprocessable_entity
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
