module Positional
  class ParserBase
    attr :object
    def initialize object
      @object = object
    end
    def parse fmt, &block
      @object.inject fmt, &block
      @object
    end
  end
end