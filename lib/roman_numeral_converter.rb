class RomanNumeralConverter
  attr_reader :input

  ROMAN_NUMS = {
    I: 1,
    IV: 4,
    V: 5,
    IX: 9,
    X: 10,
    XL: 40,
    L: 50,
    XC: 90,
    C: 100,
    CD: 400,
    D: 500,
    CM: 900,
    M: 1000 }.freeze

  def convert(value)
    @value = value.upcase
    result = 0

    return 'Not a valid roman numeric!' unless !valid? @value.scan(/\w/)

    ROMAN_NUMS.reverse_each do |roman|
      while !value.nil? && value.start_with?(roman.first.to_s)
        value = value.slice(roman.first.to_s.length, value.length)
        result += roman.last
      end
    end

    result
  end

  private

  def valid?(value)
    return false if invalid_input?(value)
  end

  def invalid_input?(value)
    value.detect { |e| !ROMAN_NUMS.keys.include?(e.to_sym) }
  end
end
