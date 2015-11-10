require_relative 'cube'

class PLL
  def solve
    cube = Cube.new

    centres = cube.get_centres
    ribbon  = cube.get_ribbon

    converted_ribbon = cube.convert(ribbon, centres)

    pll_index     = cube.pll_index(converted_ribbon)
    pll_algorithm = cube.pll_algorithm

    puts cube.solve(pll_index, pll_algorithm)
  end
end
