class Api::V1::CustomersController < ApplicationController
  def signup
    customer = Customer.new(customer_params)

    if customer.save
      render json: { message: "Bạn đã đăng ký thành công" }, status: 201
    else
      render json: { error: customer.errors.full_messages }, status: 422
    end
  end

  def login
    customer = Customer.find_by(email: params[:email])

    if customer&.authenticate(params[:password])
      token = JsonWebToken.encode(customer_id: customer.id)

      render json: { token: token }, status: 200
    else
      render json: { message: "Incorrect email or password" }, status: 401
    end
  end
  private

  def customer_params
    params.permit(:email, :password, :password_confirmation)
  end
end
