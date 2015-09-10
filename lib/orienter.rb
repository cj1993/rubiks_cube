# Returns an array of all default orientations for the ribbon or face

class Orienter
  def face(face)
    [
      face,
      face.transpose.reverse,
      face.flatten.reverse.each_slice(3).to_a,
      face.reverse.transpose
    ]
  end

  def ribbon(ribbon)
    [
      ribbon,
      ribbon.permutation.to_a[5].reverse,
      ribbon.permutation.to_a[7].reverse,
      ribbon.permutation.to_a[14].reverse
    ]
  end
end
