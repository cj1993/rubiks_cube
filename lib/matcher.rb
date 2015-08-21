class Matcher
  def oll_matcher(algorithm, face_pattern_orientations, converted_face)
    if face_pattern_orientations[0] == converted_face
      algorithm
    elsif face_pattern_orientations[1] == converted_face
      "U " + algorithm
    elsif face_pattern_orientations[2] == converted_face
      "U2 " + algorithm
    else
      "U' " + algorithm
    end
  end
end
