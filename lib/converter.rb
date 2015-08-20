require_relative '../app'

class Converter
  def top_face_converter(top_face)
    top_face.gsub(/top_face[1][1]/, 'X')
  end

  def top_ribbon_converter(top_ribbon, top_face)
    top_ribbon
  end
end
