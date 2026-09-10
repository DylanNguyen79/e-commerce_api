class OptionValue < ApplicationRecord
    belongs_to :option

    has_many :variant_option_values
    has_many :variants, through: :variant_option_values
end
