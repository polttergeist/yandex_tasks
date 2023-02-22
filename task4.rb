# frozen_string_literal: true

def step(count, output_file, string = '', left = 0, right = 0)
  if left == count && right == count
    output_file.puts(string)
  else
    step(count, output_file, "#{string}(", left + 1, right) if left < count
    step(count, output_file, "#{string})", left, right + 1) if right < left
  end
end

input_file = File.open('task4_input.txt')
output_file = File.open('task4_output.txt', 'w+')

n = input_file.readline.chomp.to_i
step(n, output_file)
