require_relative 'cube'

class OLL
  def solve
    cube = Cube.new

    face    = cube.get_face
    ribbon  = cube.get_ribbon

    converted_ribbon = cube.convert(ribbon, face)

    oll_index     = cube.oll_index(converted_ribbon)
    oll_algorithm = cube.oll_algorithm

    puts cube.solve(oll_index, oll_algorithm)
  end
end
