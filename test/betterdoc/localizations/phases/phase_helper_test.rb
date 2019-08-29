require 'test_helper'
require 'betterdoc/localizations/phases/phase_helper'

class PhaseHelperTest < Minitest::Test

  def test_all_phases_titles
    phase_helper = Betterdoc::Localizations::Phases::PhaseHelper.new
    assert_equal ['Admission', 'Anamnese', 'Matching', 'Follow-Up', 'Archive'], phase_helper.all_phases_titles('de')
    assert_equal ['Admission', 'Anamnesis', 'Matching', 'Follow-Up', 'Archive'], phase_helper.all_phases_titles('en')
  end

end
