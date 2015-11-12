class Orienter
  def orient(arg)
    arg.length == 9 ? face(arg) : non_face(arg)
  end

  private

  def face(face)
    [
      face,
      face.transpose.reverse,
      face.flatten.reverse.each_slice(3).to_a,
      face.reverse.transpose
    ]
  end

  def non_face(non_face)
    [
      non_face,
      non_face.permutation.to_a[5].reverse,
      non_face.permutation.to_a[7].reverse,
      non_face.permutation.to_a[14].reverse
    ]
  end
end
