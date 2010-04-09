module Positional
  class MaskedParse
    attr :format, :object
    def initialize object
      @object = object
    end
    def parse input, fmt=nil
      arry=[]
      (0..input.length).each do |i|
        arry << input[i]
      end
      @object.inject fmt do
        arry.shift
      end
      @object
    end
  end
end