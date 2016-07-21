class CreditCulculator
  attr_reader :question, :credits, :minerals

  CREDIT_QUESTION_PATTERN = /^how many Credits is\s+(.+)[ ?]$/.freeze

  def initialize(question)
    @question = question
  end

  def process
    @minerals = question.match(CREDIT_QUESTION_PATTERN)[1].strip
    @credits = calculate_credits
    answer
  end

  def self.is_credit_question? question
    question =~ CREDIT_QUESTION_PATTERN
  end

  private

  def answer
    "#{minerals} is #{credits} Credits"
  end

  def calculate_credits
    result = 0
    @minerals.split(" ").reverse.each do |item|
      value = InformationBuilder::KNOWLEDGE_DB[item] if InformationBuilder::KNOWLEDGE_DB.include?(item)

      if value && value.is_a?(Integer)
        result += value
      else
        result += RomanNumeralConverter.new.convert(value)
      end
    end
    result
  end
end
