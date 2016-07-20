class Converter
  attr_reader :question

  def initialize(input)
    # Process command line arguments
    # case when a new file is passed in.
    @input = input
  end

  def process(question)
    @question = question
    case
    when is_credit_question?
      CreditCulculator.new(@question).process
    when is_cost_question?
      CostCulculator.new(@question).process
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
