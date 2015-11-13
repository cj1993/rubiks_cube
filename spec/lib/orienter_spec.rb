require_relative '../../lib/orienter'

describe Orienter do

  orient = Orienter.new

  context "Orienter" do
    it "returns an Array of size 4, regardless of an arguments length" do
      face    = [%w(x x x), %w(x x x), %w(x x x)]
      ribbon  = [%w(x x x), %w(x x x), %w(x x x), %w(xx xx xx)]

      expect(orient.orient(face).length).to eq 4
      expect(orient.orient(ribbon).length).to eq 4
    end
  end
end
