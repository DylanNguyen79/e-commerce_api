class Variant < ApplicationRecord
    belongs_to :product

    has_many :variant_option_values
    has_many :option_values, through: :variant_option_values
    has_many :options, through: :option_values
    validates :sku, presence: true, uniqueness: true
end
