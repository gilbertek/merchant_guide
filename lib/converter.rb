class Converter
  attr_reader :input

  def initialize(input)
    @input = input
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
    when is_mineral_info?
      UnitParser.new(line)
    else
      "I have no idea what you are talking about"
    end
  end

  def is_mineral_info?(line)
    InformationBuilder.is_mineral_info?(line)
  end

  def is_credit_question?(line)
    CreditCulculator.is_credit_question?(line)
  end

  def is_cost_question?(line)
    CostCulculator.is_cost_question?(line)
  end
end
