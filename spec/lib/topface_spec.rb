require_relative '../../lib/topface'

describe TopFace do

  face = TopFace.new.face

  context "TopFace" do
    it "returns an Array of size 3" do
      expect(face.length).to eq 3
    end

    it "returns an Array with 9 nested elements" do
      expect(face.flatten.length).to be 9
    end

    it "returns an Array with 3 nested Arrays" do
      face.each do |row|
        expect(row.class).to be Array
      end
    end
  end
end
