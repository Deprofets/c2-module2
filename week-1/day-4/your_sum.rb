# frozen_string_literal: true

class MyArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sum(initial_value = 0)
    initial_value + (block_given? ? array.map { |x| yield x } : array).reduce(:+)
  end
end
