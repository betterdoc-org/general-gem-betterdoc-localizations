require 'test_helper'
require 'betterdoc/localizations/phases/phase'

class PhaseTest < Minitest::Test

  def test_resolve
    assert Betterdoc::Localizations::Phases::Phase.resolve('ADMISSION')
  end

  def test_resolve_not_found
    assert_nil Betterdoc::Localizations::Phases::Phase.resolve('INVALID')
  end

  def test_localize_title
    assert_equal 'Admission', Betterdoc::Localizations::Phases::Phase.resolve('ADMISSION').localize_title('de')
    assert_equal 'Admission', Betterdoc::Localizations::Phases::Phase.resolve('ADMISSION').localize_title
    assert_nil Betterdoc::Localizations::Phases::Phase.resolve('ADMISSION').localize_title('INVALID')
  end

end
