
module Positional 
  class MaskedParse < ParserBase
    def parse input, fmt=nil
      arry=[]
      (0..input.length).each do |i|
        arry << input[i]
      end
      super(fmt) do 
        arry.shift
      end
    end
  end
end