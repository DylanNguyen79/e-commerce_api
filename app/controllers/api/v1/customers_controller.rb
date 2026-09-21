class Api::V1::CustomersController < ApplicationController
  def signup
    customer = Customer.new(customer_params)

    if customer.save
      render json: { message: "Bạn đã đăng ký thành công" }, status: :created
    else
      render json: { error: customer.errors.full_message }, status: :unprocessable_entity
    end
  end
  private

  def customer_params
    params.permit(:email, :password, :password_confirmation)
  end
end
