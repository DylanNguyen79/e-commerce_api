class Category < ApplicationRecord
    has_many :products, foreign_key: :category_id
end
