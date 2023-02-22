# frozen_string_literal: true

input_file = File.open('task2_input.txt')
output_file = File.open('task2_output.txt', 'w+')

res = 0
tmp = 0
input_file.readline.chomp.to_i.times do
  line = input_file.readline
  line.chomp == '1' ? tmp += 1 : tmp = 0
  res = [res, tmp].max
end

output_file.write(res)
