require 'test_helper'
require 'betterdoc/localizations/events/event'
require 'betterdoc/localizations/events/event_helper'

class EventHelperTest < Minitest::Test

  def test_event_essential?
    helper = Object.new
    helper.extend(Betterdoc::Localizations::Events::EventHelper)
    assert helper.event_essential?('DID_RECEIVE_LEAD')
    refute helper.event_essential?('INVALID')
  end

  def test_event_title
    helper = Object.new
    helper.extend(Betterdoc::Localizations::Events::EventHelper)
    assert_equal 'Lead erstellt', helper.event_title('DID_RECEIVE_LEAD', 'de')
    assert_equal 'Lead erstellt', helper.event_title('DID_RECEIVE_LEAD')
    assert_nil helper.event_title('DID_RECEIVE_LEAD', 'INVALID')
    assert_nil helper.event_title('INVALID')
  end

  def test_current_phase_title
    helper = Object.new
    helper.extend(Betterdoc::Localizations::Events::EventHelper)
    assert_equal 'Admission', helper.current_phase_title(['type' => 'DID_RECEIVE_LEAD'])
    assert_equal 'Matching', helper.current_phase_title([{ 'type' => 'DID_RECEIVE_LEAD' }, { 'type' => 'DID_RECEIVE_FULL_ANAMNESIS_SURVEY' }])
    assert_nil helper.current_phase_title([])
  end

end
