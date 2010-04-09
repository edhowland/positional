module Positional
  class Format < FormatBase
    def convert object
      if object.kind_of? String
        '"' + object + '"'
      else
        object
      end
    end
    def to_s(fmt)
      attrs = []
      super(fmt) do |value|
        attrs << convert(value)
      end
      attrs.join ' '
    end
  end
end