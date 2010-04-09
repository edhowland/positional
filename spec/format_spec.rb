require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Format" do
  class Input
    attr :name, :pressure, :temp, :rate, :flag, :id
    def initialize(name, pressure, temp, rate, flag, id)
      @name = name
      @pressure = pressure
      @temp = temp
      @rate = rate
      @flag = flag
      @id = id
    end
  end
  
  before(:each) do
    @fmt = [:id, :name, :pressure, :temp, :flag, :rate]
    @object = Input.new("calc1", 17.8, 32, 10000, 1, 8009)
    @formatter = Positional::Format.new @object.extend Positional::Decorator::Message
  end
  it "should equal coildselectioncooling input" do
    @formatter.to_s(@fmt).should == '8009 "calc1" 17.8 32 1 10000'
  end
  
  describe "MaskedFormatter" do
    before(:each) do
      @object = ['A', 'C', 'T', 'G', 'A', 'T']
      @formatter = Positional::MaskedFormat.new @object.extend Positional::Decorator::Index
    end
    it "should format to a gene sequemce" do
      @formatter.to_s.should == 'ACTGAT'
    end
  end
end
