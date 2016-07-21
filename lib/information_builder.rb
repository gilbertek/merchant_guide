class InformationBuilder
  attr_reader :question, :db

  UNIT_INFORMATION_PATTERN = /^(\w*) is (\w*)$/.freeze
  MINERAL_INFORMATION_PATTERN = /(\w+) ? (\w+) ? (\w+) is (\d+) Credits$/.freeze

  def initialize(question)
    @question = question
    @db ||= {}
    parse
  end

  def parse
    parse_unit if question =~ UNIT_INFORMATION_PATTERN
    parse_mineral if question =~ MINERAL_INFORMATION_PATTERN
  end

  def parse_unit
    data = question.match(UNIT_INFORMATION_PATTERN)
    db[data[1]] = data[2]
  end

  def parse_mineral
    data = question.match(MINERAL_INFORMATION_PATTERN)

  end

  def self.is_mineral_info? question
    question =~ UNIT_INFORMATION_PATTERN || question =~ MINERAL_INFORMATION_PATTERN
  end

  def valid_info

  end
end
