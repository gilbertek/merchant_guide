require "byebug"

class Converter
  attr_reader :input, :minerals

  def initialize(input)
    @input = input.first
    @minerals ||= {}
  end

  def process
    fail "No file found" if input.nil?

    File.open(input, 'r').each_line do |line|
      parse line
    end
  end

  def parse(line)
    case
    when is_credit_question?(line)
      CreditCulculator.new(line).process
    when is_cost_question?
      CostCulculator.new(line).process
    when is_unit_info?
      UnitParser.new(line)
    else
      "I have no idea what you are talking about"
    end
  end

  def is_credit_question?
    CreditCulculator.is_credit_question?(@question)
  end

  def is_cost_question?
    CostCulculator.is_cost_question?(@question)
  end
end
