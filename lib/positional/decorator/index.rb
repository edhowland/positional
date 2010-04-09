module Positional
  module Decorator
    module Index
      def inject fmt, &block
        0.upto length-1 do |i|
          self[i] = yield
        end
      end
    end
  end
end