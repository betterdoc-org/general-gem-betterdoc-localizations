require_relative 'phase'

module Betterdoc
  module Localizations
    module Phases
      module PhaseHelper

        def all_phases_titles(locale = 'de')
          Phase.all.map { |_key, value| value.localize_title(locale) }
        end

      end
    end
  end
end
