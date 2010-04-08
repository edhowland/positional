require "pp"
class SequenceQuality
  attr_accessor :phred, :length
  def initialize(length)
    @length = length
    @phred=[]
  end
  def inject(&block) # gets called by Positional::Parse
    1.upto length do
      @phred << yield
    end
  end
  def [](index)
    raise StandardError,new('Range error') if index < 1 or index > length
    @phred[index-1]
  end
end

string='1 8 15 22 60 55 57 56 58 55 60 58 57 59 55 50 44 18 5 6'

sq=SequenceQuality.new 20
qs=string.split(/ /)

sq.inject do
  qs.shift
end

pp sq
