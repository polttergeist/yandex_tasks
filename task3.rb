# frozen_string_literal: true

input_file = File.open('task3_input.txt', 'r')
output_file = File.open('task3_output.txt', 'w+')

prev = nil
input_file.readline.chomp.to_i.times do
  line = input_file.readline
  output_file.write(line) if line.chomp.to_i != prev || prev.nil?
  prev = line.chomp.to_i
end
