require 'test_helper'
require 'betterdoc/localizations/phases/phase_helper'

class PhaseHelperTest < Minitest::Test

  def test_all_phases_titles
    helper = Object.new
    helper.extend(Betterdoc::Localizations::Phases::PhaseHelper)
    assert_equal ['Admission', 'Anamnese', 'Matching', 'Follow-Up', 'Archive'], helper.all_phases_titles('de')
    assert_equal ['Admission', 'Anamnesis', 'Matching', 'Follow-Up', 'Archive'], helper.all_phases_titles('en')
  end

end
