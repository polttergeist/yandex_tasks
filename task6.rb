# frozen_string_literal: true

class City
  attr_reader :x, :y, :number

  def initialize(x, y, number:)
    @x = x
    @y = y
    @number = number
  end

  def -(other)
    (x - other.x).abs + (y - other.y).abs
  end
end

input_file = File.open('task6_input.txt')
output_file = File.open('task6_output.txt', 'w+')

cities = []

1.upto(input_file.readline.chomp.to_i) do |i|
  cities << City.new(*input_file.readline.chomp.split.map(&:to_i), number: i)
end

max_distance = input_file.readline.chomp.to_i

departure_city_number, destination_city_number = *input_file.readline.chomp.split.map(&:to_i)
departure_city = cities[departure_city_number - 1]
destination_city = cities[destination_city_number - 1]

available_cities = [departure_city]
cities.delete_at(departure_city_number - 1)
step_number = 1

# filter all available cities (until cities.empty?). if we find the departure city, we return step_number,
# otherwise we keep going. if the size of array of cities doesn't change, we return -1

until cities.empty?
  cities_initial_length = cities.length
  filtered_cities = []

  cities.each do |city|
    available_cities.each do |available_city|
      next if city - available_city > max_distance

      filtered_cities << city
      cities.delete(city)
      break
    end
  end

  break if filtered_cities.include?(destination_city)

  available_cities = filtered_cities.clone
  step_number += 1
  if cities_initial_length == cities.length
    step_number = -1
    break
  end
end

output_file.write(step_number)
