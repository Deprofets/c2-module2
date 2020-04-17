# frozen_string_literal: true

class MyArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sum(initial_value = 0)
    array.reduce(initial_value) { |sum, x| sum + (block_given? ? yield(x) : x) }
  end
end
