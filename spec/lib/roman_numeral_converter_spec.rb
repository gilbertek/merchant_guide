require 'spec_helper'

describe RomanNumeralConverter do
  describe "#convert" do
    it "returns 1 when given I" do
      expect(subject.convert("I")).to eq(1)
    end

    it "returns 5 when given V" do
      expect(subject.convert("V")).to eq(5)
    end

    it "returns 42 when given XLII" do
      expect(subject.convert("XLII")).to eq(42)
    end
  end
end
