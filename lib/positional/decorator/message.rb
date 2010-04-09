module Positional
  module Decorator
    module Message
      def inject(fmt, &block)
        fmt.each do |f|
          message = (f.to_s + '=').to_sym
          self.send message, yield
        end
      end
      def remove(fmt, &block)
        fmt.each do |message|
          yield self.send message
        end
      end
    end
  end
end