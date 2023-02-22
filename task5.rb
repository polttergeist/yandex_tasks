# frozen_string_literal: true

input_file = File.open('task5_input.txt')
output_file = File.open('task5_output.txt', 'w+')

line1 = input_file.readline.chomp
line2 = input_file.readline.chomp

line1.each_char do |char|
  break if line1.empty? || line2.empty?

  line1.sub!(char, '')
  line2.sub!(char, '')
end

line1.empty? && line2.empty? ? output_file.write('1') : output_file.write('0')
