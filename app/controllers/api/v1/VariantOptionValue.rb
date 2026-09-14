VariantOptionValue.create(option_id: 1, option_value_id: 1, variant_id: 1)
VariantOptionValue.create(option_id: 2, option_value_id: 3, variant_id: 1)

VariantOptionValue.create(option_id: 1, option_value_id: 1, variant_id: 2)
VariantOptionValue.create(option_id: 2, option_value_id: 4, variant_id: 2)

VariantOptionValue.create(option_id: 1, option_value_id: 1, variant_id: 3)
VariantOptionValue.create(option_id: 2, option_value_id: 5, variant_id: 3)

VariantOptionValue.create(option_id: 1, option_value_id: 2, variant_id: 4)
VariantOptionValue.create(option_id: 2, option_value_id: 3, variant_id: 4)

VariantOptionValue.create(option_id: 1, option_value_id: 2, variant_id: 5)
VariantOptionValue.create(option_id: 2, option_value_id: 4, variant_id: 5)

VariantOptionValue.create(option_id: 1, option_value_id: 2, variant_id: 6)
VariantOptionValue.create(option_id: 2, option_value_id: 5, variant_id: 6)

variant = [ 1, 2, 3, 4, 5, 6 ]
option = [ 1, 2, 3]
option_values = [ [ 1, 2 ], [ 3, 4, 5 ], [6]]

variant.loop do |var, i|
  variant.size / optione_values[i].size
  option.loop do  |opt, i|
    0 - 0 - [0][0]      1
    0 - 1 - [1][0]
    0 - 2 - [2][0]

    1 - 0 - [0][0]      2
    1 - 1 - [1][1]
    1 - 2 - [2][0]

    2 - 0 - [0][0]      3
    2 - 1 - [1][2]    
    2 - 2 - [2][0]

    3 - 0 - [0][1]      4 
    3 - 1 - [1][0]    
    3 - 2 - [2][0]

    4 - 0 - [0][1]      5
    4 - 1 - [1][1]    
    4 - 2 - [2][0]

    5 - 0 - [0][1]      6
    5 - 1 - [1][2]
    5 - 2 - [2][0]

    j = i
    opt_size = option[i].size
    k += ?? / ?? 
     VariantOptionValue.create(variant_id: var, option_id: opt, option_value_id: option_values[i][k])
 end
end

option_values[i].size
option_values[0].size = 2
option_values[1].size = 3
repeat = var.size / option_values[i].size

vov_count = variant.size * option.size = 12 

0                     0, 0, 0, 1, 1, 1
opt_id: 1, opt_value: 1, 1, 1, 2, 2, 2

1                     2  3  4  2  3  4
opt_id: 2, opt_value: 3, 4, 5, 3, 4, 5

2                     3  3  3  3  3  3
opt_id: 3, opt_value: 6, 6, 6, 6, 6, 6


expected: 
[variant: 1, option: 1, option_values: 1]
[variant: 1, option: 2, option_values: 3]
[variant: 1, option: 3, option_values: 6]

[variant: 2, option: 1, option_values: 1]
[variant: 2, option: 2, option_values: 4]
[variant: 2, option: 3, option_values: 6]


[variant: 3, option: 1, option_values: 1]
[variant: 3, option: 2, option_values: 5]
[variant: 3, option: 3, option_values: 6]


[variant: 4, option: 1, option_values: 2]
[variant: 4, option: 2, option_values: 3]
[variant: 4, option: 3, option_values: 6]

[variant: 5, option: 1, option_values: 2]
[variant: 5, option: 2, option_values: 4]
[variant: 5, option: 3, option_values: 6]

[variant: 6, option: 1, option_values: 2]
[variant: 6, option: 2, option_values: 5]
[variant: 6, option: 3, option_values: 6]

