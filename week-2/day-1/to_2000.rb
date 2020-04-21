class String
  def to_2000
    chars.reduce("") { |str, c| str << (str.size.even? ? c.upcase : c) }
  end
end
