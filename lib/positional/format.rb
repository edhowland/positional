module Positional
  class Format
    def initialize fmt, object
      @format = fmt
      @object = object
    end
    def to_s
      attrs = []
      @format.each do |f|
        attrs << @object.send(f)
      end
      attrs.join ' '
    end
  end
end