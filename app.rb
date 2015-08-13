require_relative 'lib/topface'
require_relative 'lib/topribbon'
require_relative 'lib/rows'
require_relative 'utils/oll/ta'
require_relative 'utils/oll/tb'
require_relative 'utils/prettyprint'

class App
  def app
    tf = TopFace.new
    tr = TopRibbon.new
    ta = TA.new
    tb = TB.new
    pp = PrettyPrint.new
    r = Rows.new
    # top_face = ta.top_pattern
    # top_ribbon = ta.top_ribbon
    # p ta.algorithm if (tf.top_face == face_pattern) && (tr.top_ribbon == ribbon_pattern)
    pp.pretty_print_face(tf.top_face)
    print "\n"
    pp.pretty_print_ribbon(tr.top_ribbon)
  end
end

App.new.app
