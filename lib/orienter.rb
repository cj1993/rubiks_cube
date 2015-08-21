class Orienter
  def face_orientations(alg)
    [
      alg,
      alg.transpose.reverse,
      alg.flatten.reverse.each_slice(3).to_a,
      alg.reverse.transpose
    ]
  end
end
