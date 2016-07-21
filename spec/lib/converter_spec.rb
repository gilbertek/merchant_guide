require 'spec_helper'

describe Converter do
  let(:file) { File.dirname(__FILE__) + "/../../data/input.txt" }

  describe "#process" do
    OUTPUT = "pish tegj glob glob is 42
glob prok Silver is 68 Credits
glob prok Gold is 57800 Credits
glob prok Iron is 782 Credits
I have no idea what you are talking about"
  end

  it "return converted units when given an input" do
    converter = described_class.new(file)
    expect(converter.process).to eq(OUTPUT)
  end
end
