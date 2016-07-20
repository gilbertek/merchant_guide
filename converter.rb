require "rubygems"
require "bundler/setup"
require "byebug"
require "rspec/autorun"




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

    RomanNumeral.new(roman_numeral).value
  end
end

class CostCulculator
  attr_reader :question

  COST_QUESTION_PATTERN = /^how much is\s+(.+)[ ?]$/.freeze

  def initialize(question)
    @question = question
  end

  def value
  end

  def self.is_cost_question? question
    question =~ COST_QUESTION_PATTERN
  end
end

class RomanNumeral
  attr_reader :input, :value

  ROMAN_NUMS = { I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1000 }.freeze

  def initialize(input)
    @input = input

    process if valid?
  end

  def process
    @value = 1
  end

  def valid?
  end
end


class MineralParser
  attr_reader :query

  MINERALS = { "glob" => "I", "prok" => "V", "pish" => "X", "tegj" => "L" }

  MINERAL_PATTERN = /^(\w*) is (\w*)$/.freeze

  def initialize(query)
    @query = query

    parse if valid_info?
  end

  def parse
    data = query.match(MINERAL_PATTERN)
    MINERALS[data[1]] = data[2]
  end

  private

  def valid_info?
    query =~ MINERAL_PATTERN
  end
end

describe Converter do
  describe "#convert" do
    let(:gebrish) { "how much wood could a woodchuck chuck if a woodchuck could chuck wood ?" }
    let(:default_message) { "I have no idea what you are talking about" }
    let(:valid_input_1) { "how many Credits is glob prok Silver ?" }
    let(:valid_answer_1) { "glob prok Silver is 68 Credits" }

    let(:valid_input_2) { "how much is pish tegj glob glob ?" }
    let(:valid_input_3) { "how many Credits is glob prok Gold ?" }
    let(:valid_input_4) { "how many Credits is glob prok Iron ?" }

    let(:valid_answer_2) { "pish tegj glob glob is 42" }
    let(:valid_answer_3) { "glob prok Gold is 57800 Credits" }
    let(:valid_answer_4) { "glob prok Iron is 782 Credits" }

    it "returns the cost of a given mineral" do
      converter = Converter.new

      expect(converter.process(gebrish)).to eq(default_message)
    end

    it "returns valid answer when given valid units" do
      converter = Converter.new

      expect(converter.process(valid_input_1)).to eq(valid_answer_1)
    end
  end
end

describe RomanNumeral do

end
