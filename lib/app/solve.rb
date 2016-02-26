require_relative 'cube'

class Solve
  attr_reader :cube

  def initialize
    @cube = Cube.new
  end

  def solve
    oll & pll
  end

  private

  def oll
    face    = cube.get_face
    ribbon  = cube.get_ribbon

    converted_ribbon = cube.convert(ribbon, face)

    oll_index     = cube.oll_index(converted_ribbon)
    oll_algorithm = cube.oll_algorithm

    cube.solve(oll_index, oll_algorithm)
  end

  def pll
    centres = cube.get_centres
    ribbon  = cube.get_ribbon

    converted_ribbon = cube.convert(ribbon, centres)

    pll_index     = cube.pll_index
    pll_algorithm = cube.pll_algorithm(converted_ribbon)

    cube.solve(pll_index, pll_algorithm)
  end
end
