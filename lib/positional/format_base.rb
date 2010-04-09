module Positional
  class FormatBase
    attr :object
    def initialize object
      @object = object
    end
    def to_s(fmt=nil, &block)
      @object.remove(fmt, &block)
    end
  end
end