# frozen_string_literal: true

def array_of_fixnums?(array)
  array.all? { |item| item.is_a? Fixnum }
end
