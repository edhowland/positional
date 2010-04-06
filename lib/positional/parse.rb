module Positional
  class Parse
    attr :format, :object
    def initialize fmt, object=nil
      @format = fmt
      @object = object
    end
    def convert string
      case string
      when /^\d+$/
        string.to_i
      when /^\d*\.\d+$/
        string.to_f
      when /^"([^"]*)"$/
        $1
      else
        string
      end
    end
    def string_start?(string)
      string[0] == '"'
    end
    def string_end? string
      string[-1] == '"'
    end
    def collect_string arry
      arry[0] = arry[0][1..-1]
      arry[-1] = arry[-1][0..-2]
      arry.join ' '
    end
    def parse input
      arry = input.split(/ ("[^"]*)*/)
      @format.each_with_index do |f, i|
        msg = (f.to_s + '=').to_sym
        @object.send msg, convert(arry[i]) 
      end
      @object
    end
  end
end