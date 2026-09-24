class Api::V1::ProductsController < ApplicationController
    def index
      render json: Product.all, status: 200
    end

    def show
      product = Product.find_by(id: params[:id])

      if product
        render json: product, include: {
            variants: {
                include: {
                    option_values: {
                        include: :option
                    }
                }
            }
        }, status: 200
      else
        render json: { message: "Product not found" }, status: 404
      end
    end

    def create
        product = Product.new(product_params)

        if product.save

        variant_count = 1
        variant_ids = []
        option_ids = []
        option_value_ids = []
        option_value_group = []
        vov_arr = []

        # Get Option ID && Option Value ID
        params[:options].each do |option|
            opt = Option.create(name: option["name"])
            option_ids.push(opt.id)

            variant_count *= option[:option_values].size

            option_value_ids = []
            option[:option_values].each do |opt_val|
                option_value = OptionValue.create(values: opt_val, option_id: opt.id)
                option_value_ids.push(option_value.id)
            end
            option_value_group.push(option_value_ids)
        end

        # Get VariantID
        params[:variants].each do |variant|
            variant = Variant.create(
                product_id: product.id,
                sku: variant[:sku],
                stock: variant[:stock],
                variant_price: variant[:variant_price],
            )
            variant_ids.push(variant.id)
        end

        # Create combinations of OptionValue IDs
        combinations = option_value_group.reduce([ [] ]) do |result, group|
            result.flat_map do |combination|
                group.map do |option_value_id|
                combination + [ option_value_id ]
                end
            end
        end

        # Create data for VariantOptionValue
        combinations.each_with_index do |combination, i|
            combination.each_with_index do |option_value_id, j|
                vov_arr.push(
                variant_id: variant_ids[i],
                option_id: option_ids[j],
                option_value_id: option_value_id
                )
            end
        end

        vov_arr.each do |vov|
            VariantOptionValue.create(
                variant_id: vov[:variant_id],
                option_id: vov[:option_id],
                option_value_id: vov[:option_value_id]
            )
        end
            render json: product, status: 201
        else
            render json: { errors: product.errors.full_messages }, status: 422
        end
    end



  def update
    product = Product.find_by(id: params[:id])

    if product && product.update(product_params)
        render json: { message: "Updated successfully" }, status: 200
    else
        render json: { message: "Product not found or Update failed" }, status: 422
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])

    if product.nil?
        render json: { message: "Product not exist" }, status: 404
    elsif product.destroy
        render json: { message: "Deleted product" }, status: 200
    else
        render json: { message: "Product not found" }, status: 422
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
