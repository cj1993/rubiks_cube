require_relative 'lib/app/oll'
require_relative 'lib/app/pll'

class App
  OLL.new.solve
  PLL.new.solve
end

App.new
