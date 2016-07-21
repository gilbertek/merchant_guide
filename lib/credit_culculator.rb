class CreditCulculator
  attr_reader :question, :credits, :minerals

  CREDIT_QUESTION_PATTERN = /^how many Credits is\s+(.+)[ ?]$/.freeze

  def initialize(question)
    @question = question
  end

  def process
    @minerals = question.match(CREDIT_QUESTION_PATTERN)[1].strip
    # @credits = calculate_credits
    answer
  end

  def answer
    "#{minerals} is #{credits}"
  end

  def self.is_credit_question? question
    question =~ CREDIT_QUESTION_PATTERN
  end

  private

  def calculate_credits
    roman_numeral = ''
    @minerals.split(" ").each do |item|
      roman_numeral += MineralParser::MINERALS[item] if MineralParser::MINERALS.include? item
    end

    RomanNumeralConverter.convert(roman_numeral)
  end
end
