class InformationBuilder
  attr_reader :question
  KNOWLEDGE_DB ||= {}

  UNIT_INFORMATION_PATTERN = /^(\w*) is (\w*)$/.freeze
  MINERAL_INFORMATION_PATTERN = /^(\w+) ? (\w+) ? (\w+) is (\d+) Credits$/.freeze

  def initialize(question)
    @question = question
  end

  def process
    parse_unit if question =~ UNIT_INFORMATION_PATTERN
    parse_mineral if question =~ MINERAL_INFORMATION_PATTERN
  end

  def parse_unit
    data = question.match(UNIT_INFORMATION_PATTERN)
    KNOWLEDGE_DB[data[1]] = data[2]
  end

  def parse_mineral
    data = question.match(MINERAL_INFORMATION_PATTERN).to_a

    total         = data.last.to_i
    mineral       = data[-2]
    unit_value    = 0

    data.each do |elt|
      if KNOWLEDGE_DB.keys.include?(elt)
        unit_value += RomanNumeralConverter.new.convert(KNOWLEDGE_DB[elt])
      end
    end

    mineral_value = total - unit_value
    KNOWLEDGE_DB[mineral] = mineral_value
  end

  def self.is_mineral_info? question
    question =~ UNIT_INFORMATION_PATTERN || question =~ MINERAL_INFORMATION_PATTERN
  end
end
