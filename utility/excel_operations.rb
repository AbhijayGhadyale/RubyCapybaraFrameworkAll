require 'rubyXL'


workbook = RubyXL::Parser.parse('./new_prices.xlsx')

puts workbook

sheet =workbook['Login'].

worksheet = workbook[0]

puts sheet
puts worksheet

puts worksheet[2][1]
puts worksheet[2][2]
puts worksheet[2][3]

worksheet.add_cell(2, 3, 'pass')


