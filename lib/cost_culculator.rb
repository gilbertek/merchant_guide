class CostCulculator
  attr_reader :question

  COST_QUESTION_PATTERN = /^how much is\s+(.+)[ ?]$/.freeze

  def initialize(question)
    @question = question
  end

  def value
  end

  def process

  end

  def self.is_cost_question? question
    question =~ COST_QUESTION_PATTERN
  end
end
