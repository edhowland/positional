require "syntax"

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
    def whitespace? string
      if string =~ /^\s+$+/ or string =~ /^$/; true; else; false; end
    end
    def quote? string
      if string =~ /"|'/; true; else; false; end
    end
    def significant? string
      unless quote?(string) or whitespace?(string)
        true
      else
        false
      end
    end
    def parse input
      arry = []
      tokener = Syntax.load 'ruby'
      tokener.tokenize(input) do |token|
        arry << token.to_s if significant?(token.to_s)
      end
      @format.each_with_index do |f, i|
        msg = (f.to_s + '=').to_sym
        @object.send msg, convert(arry[i]) 
      end
      @object
    end
  end
end