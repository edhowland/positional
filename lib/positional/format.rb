module Positional
  class Format
    def initialize fmt, object
      @format = fmt
      @object = object
    end
    def convert object
      if object.kind_of? String
        '"' + object + '"'
      else
        object
      end
    end
    def to_s
      attrs = []
      @format.each do |f|
        attrs << convert(@object.send(f))
      end
      attrs.join ' '
    end
  end
end