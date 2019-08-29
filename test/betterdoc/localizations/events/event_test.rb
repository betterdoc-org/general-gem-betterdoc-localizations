require 'test_helper'
require 'betterdoc/localizations/events/event'

class EventTest < Minitest::Test

  def test_resolve
    assert Betterdoc::Localizations::Events::Event.resolve('DID_RECEIVE_LEAD')
  end

  def test_resolve_not_found
    assert_nil Betterdoc::Localizations::Events::Event.resolve('INVALID')
  end

  def test_phase
    assert_equal 'ADMISSION', Betterdoc::Localizations::Events::Event.resolve('DID_RECEIVE_LEAD').phase.key
  end

  def test_localize_title
    assert_equal 'Lead erstellt', Betterdoc::Localizations::Events::Event.resolve('DID_RECEIVE_LEAD').localize_title('de')
    assert_equal 'Lead erstellt', Betterdoc::Localizations::Events::Event.resolve('DID_RECEIVE_LEAD').localize_title
    assert_nil Betterdoc::Localizations::Events::Event.resolve('DID_RECEIVE_LEAD').localize_title('INVALID')
  end

end
