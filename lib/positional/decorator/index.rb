module Positional
  module Decorator
    module Index
      def inject fmt, &block
        0.upto length-1 do |i|
          self[i] = yield
        end
      end
      def remove fmt, &block
        self.each {|e| yield e}
      end
    end
  end
end