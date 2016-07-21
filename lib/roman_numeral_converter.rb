class RomanNumeralConverter
  attr_reader :input

  ROMAN_NUMS = { I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1000 }.freeze

  def self.convert(input)
    @input = input
  end


end
