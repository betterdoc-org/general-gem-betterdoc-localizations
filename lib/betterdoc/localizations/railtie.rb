require_relative 'events/event_helper'
require_relative 'phases/phase_helper'

module Betterdoc
  module Localizations
    class Railtie < Rails::Railtie

      initializer 'betterdoc.localizations.helpers' do
        ActiveSupport.on_load(:action_view) do
          class ActionView::Base
            include Betterdoc::Localizations::Events::EventHelper
            include Betterdoc::Localizations::Phases::PhaseHelper
          end
        end
      end

    end
  end
end
