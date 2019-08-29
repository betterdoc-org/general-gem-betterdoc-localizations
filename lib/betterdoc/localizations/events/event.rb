require 'yaml'
require_relative '../phases/phase.rb'

module Betterdoc
  module Localizations
    module Events
      class Event

        attr_reader :key
        attr_reader :phase

        def initialize(key, titles, phase)
          @key = key
          @titles = titles
          @phase = phase
        end

        def localize_title(locale = 'de')
          @titles[locale]
        end

        events = {}
        events_source_file = File.expand_path('../../../../data/events/events.yml', File.dirname(__FILE__))
        events_source = File.read(events_source_file)
        events_yaml = YAML.safe_load(events_source)
        events_yaml.each do |key, value|
          events[key.upcase] = Event.new(key, value['localizations'], Betterdoc::Localizations::Phases::Phase.resolve(value['phase']))
        end
        @phases = events

        class << self

          def resolve(event_type)
            @phases[event_type.to_s.upcase]
          end

          def all
            @phases
          end

        end

      end
    end
  end
end
