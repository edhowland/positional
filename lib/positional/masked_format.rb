module Positional
  class MaskedFormat < FormatBase
    def to_s(fmt=nil)
      str=''
      super(fmt) do |c|
        str << c
      end
      str
    end
  end
end