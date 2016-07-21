class InformationBuilder
  attr_reader :question

  INFORMATION_QUESTION_PATTERN = /^how much is\s+(.+)[ ?]$/.freeze

  def initialize(question)
    @question = question
  end

  def value
  end

  def self.is_mineral_info? question
    question =~ INFORMATION_QUESTION_PATTERN
  end
end
