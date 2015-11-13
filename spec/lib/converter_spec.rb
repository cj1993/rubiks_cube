require_relative '../../lib/converter'

describe Converter do

  converter = Converter.new

  context "Converter" do
    it "returns a coverted ribbon when a ribbon and a face are passed in" do
      ribbon = [%w(y y o), %w(b b r), %w(g y y), %w(b o o)]
      face   = [%w(r r y), %w(y y y), %w(g g y)]

      expect(converter.convert(ribbon, face)).to eq [["x", "x", "."], [".", ".", "."], [".", "x", "x"], [".", ".", "."]]
    end

    it "returns a coverted ribbon when a ribbon and centres are passed in" do
      ribbon  = [%w(r r o), %w(b g g), %w(o b r), %w(g o b)]
      centres = %w(r g o b)

      expect(converter.convert(ribbon, centres)).to eq [[".", ".", "x"], ["x", ".", "."], [".", "x", "x"], ["x", "x", "."]]
    end
  end
end
