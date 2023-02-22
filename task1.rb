# frozen_string_literal: true

input_file = File.open('task1_input.txt')
output_file = File.open('task1_output.txt', 'w+')

a = input_file.readline.chomp
b = input_file.readline.chomp

res = 0
b.each_char { |char| res += 1 if a.include?(char) }

output_file.write(res)
