require 'yaml'

module Betterdoc
  module Localizations
    module Phases
      class Phase

        attr_reader :key

        def initialize(key, titles)
          @key = key
          @titles = titles
        end

        def localize_title(locale = 'de')
          @titles[locale]
        end

        phases = {}
        phases_source_file = File.expand_path('../../../../data/phases/phases.yml', File.dirname(__FILE__))
        phases_source = File.read(phases_source_file)
        phases_yaml = YAML.safe_load(phases_source)
        phases_yaml.each do |key, value|
          phases[key.upcase] = Phase.new(key, value['localizations'])
        end
        @phases = phases

        class << self

          def resolve(phase_key)
            @phases[phase_key.to_s.upcase]
          end

          def all
            @phases
          end

        end

      end
    end
  end
end
