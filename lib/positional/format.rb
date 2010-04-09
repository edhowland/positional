module Positional
  class Format < FormatBase
    alias :format :to_s
    def convert object
      if object.kind_of? String
        '"' + object + '"'
      else
        object
      end
    end
    def to_s(fmt=nil)
      attrs = []
      super(fmt) do |value|
        attrs << convert(value)
      end
      attrs.join ' '
    end
  end
end