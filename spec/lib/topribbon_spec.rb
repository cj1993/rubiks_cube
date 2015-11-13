require_relative '../../lib/topribbon'

describe TopRibbon do

  ribbon = TopRibbon.new.ribbon

  context "TopRibbon" do

    it "returns an Array of size 4" do
      expect(ribbon.length).to eq 4
    end

    it "returns an Array with nested Arrays" do
      ribbon.each do |row|
        expect(row.class).to be Array
      end
    end

    it "returns an Array with 12 nested elements" do
      expect(ribbon.flatten.length).to eq 12
    end
  end
end
