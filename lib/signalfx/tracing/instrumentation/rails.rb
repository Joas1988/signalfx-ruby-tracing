module SignalFx
  module Tracing
    module Instrumenter
      module Rails

        Register.add_lib :Rails, self

        class << self

          def instrument(rack_tracer: true)
            require 'rails/tracer'
            require 'rack/tracer'

            if rack_tracer
              # add rack middlewares
              ::Rails.configuration.middleware.use(::Rack::Tracer)
              ::Rails.configuration.middleware.insert_after(::Rack::Tracer, ::Rails::Rack::Tracer)
            end

            ::Rails::Tracer.instrument(full_trace: true)
          end
        end
      end
    end
  end
end