require_relative '../../lib/matcher'

describe Matcher do

  match = Matcher.new

  context "Matcher" do
    it "returns the correct algorithm for each index" do
      algorithm = "R U R' U' R' F R2 U' R' U' R U R' F'"
      index     = [0, 1, 2, 3]

      expect(match.match(index[0], algorithm)).to eq "R U R' U' R' F R2 U' R' U' R U R' F'"
      expect(match.match(index[1], algorithm)).to eq "U R U R' U' R' F R2 U' R' U' R U R' F'"
      expect(match.match(index[2], algorithm)).to eq "U2 R U R' U' R' F R2 U' R' U' R U R' F'"
      expect(match.match(index[3], algorithm)).to eq "U' R U R' U' R' F R2 U' R' U' R U R' F'"
    end

    # TODO : implement test for abort 'Invalid case.' for nil algorithm
    # it "aborts program and leaves the message 'Invalid case.' when nil algorithm is passed in" do
    #   algorithm = nil
    #   index     = 1
    #
    #   expect(match.match(index, algorithm)).to
    # end
  end
end
