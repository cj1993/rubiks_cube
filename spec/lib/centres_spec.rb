require_relative '../../lib/centres'

describe Centres do

  x_y_centres = Centres.new.x_y_centres

  context "Centres" do

    it "returns an Array of size 4" do
      expect(x_y_centres.length).to eq 4
    end

    it "returns an Array with no nested elements" do
      x_y_centres.each do |element|
        expect(element.class).to be String
      end
    end
  end
end
