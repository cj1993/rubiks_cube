class Matcher
  def oll(algorithm, face_pattern_orientations, converted_face)
    case converted_face
    when face_pattern_orientations[0]
      algorithm
    when face_pattern_orientations[1]
      "U " + algorithm
    when face_pattern_orientations[2]
      "U2 " + algorithm
    else
      "U' " + algorithm
    end
  end
end
