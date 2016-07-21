class CostCulculator
  attr_reader :question, :cost, :minerals

  COST_QUESTION_PATTERN = /^how much is\s+(.+)[ ?]$/.freeze

  def initialize(question)
    @question = question
  end

  def process
    @minerals = question.match(COST_QUESTION_PATTERN)[1].strip
    @cost = calculate_cost
    answer
  end

  def self.is_cost_question? question
    question =~ COST_QUESTION_PATTERN
  end

  private

  def answer
    "#{minerals} is #{cost}"
  end

  def calculate_cost
    roman_numeral = ''
    minerals.split(" ").each do |item|
      roman_numeral.concat(InformationBuilder::KNOWLEDGE_DB[item]) if InformationBuilder::KNOWLEDGE_DB.include?(item)
    end
    RomanNumeralConverter.new.convert(roman_numeral)
  end
end
