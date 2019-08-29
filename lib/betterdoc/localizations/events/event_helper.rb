require_relative 'event'

module Betterdoc
  module Localizations
    module Events
      class EventHelper

        def event_essential?(event)
          !Event.resolve(event).nil?
        end

        def event_title(event, locale = 'de')
          Event.resolve(event)&.localize_title(locale)
        end

        def current_phase_title(all_events, locale = 'de')
          all_events.reverse_each do |event|
            event = Event.resolve(event['type'])
            return event.phase.localize_title(locale) if event&.phase
          end
          nil
        end

      end
    end
  end
end
