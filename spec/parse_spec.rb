require "pp"
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Parse" do
  before(:each) do
    class CoilSelectionCoolingOutput
      attr_accessor :criteria_errors, :ari_errors,
      :face_area, :error_msg
    end
    
    @fmt = [:criteria_errors, :ari_errors, :face_area, :error_msg]
    @object = CoilSelectionCoolingOutput.new
    @object.extend Positional::Decorator::Message
    @parser = Positional::Parse.new @object
  end
  
  it "should convert '0' to 0" do
    @parser.convert('0').should == 0
  end
  
  it "should convert '99' to 99" do
    @parser.convert('99').should == 99
  end
  
  it "should convert '18.2'" do
    @parser.convert('18.2').should == 18.2
  end
  
  it "should convert a string" do
    @parser.convert('none').should == 'none'
  end
  
  it "should convert a quoted string" do
    @parser.convert("\"any thing\"").should == 'any thing'
  end
  
  it "should parse input into an object" do
    obj = @parser.parse('0 99 19.01 no', @fmt)
    obj.criteria_errors.should == 0
    obj.ari_errors.should == 99
    obj.face_area.should == 19.01
    obj.error_msg.should == "no"
  end
  
  it "should parse quoted string input" do
    obj = @parser.parse('0 99 19.01 "no"', @fmt)
    obj.criteria_errors.should == 0
    obj.ari_errors.should == 99
    obj.face_area.should == 19.01
    obj.error_msg.should == "no"
  end


  it "should parse white space" do
    @parser.whitespace?(' ').should be_true
    @parser.whitespace?('    ').should be_true
    @parser.whitespace?('').should be_true
  end

  it "should parse non whitespace" do
    @parser.whitespace?('aaaa').should_not be_true
  end

  it "should parse quotes" do
    @parser.quote?('"').should be_true
    @parser.quote?("'").should be_true
  end

  it "should ignore non-significant tokens" do
    @parser.significant?(' ').should be_false
    @parser.significant?('     ').should be_false
    @parser.significant?('aaa').should be_true
    @parser.significant?('aaa bbb').should be_true
    @parser.significant?('0').should be_true
    @parser.significant?('1.4').should be_true
    @parser.significant?('"').should be_false
  end

  it "should parse multi-word quoted string input" do
    obj = @parser.parse('0 99    19.01 "any thing"', @fmt)
    obj.criteria_errors.should == 0
    obj.ari_errors.should == 99
    obj.face_area.should == 19.01
    obj.error_msg.should == "any thing"
  end

  class UnityArray < Array
    alias :old_ndx :[]
    def [](index)
      raise StandardError.new("Range error (#{index < 1 ? '<' : '>'})") if index < 1 or index > length
      old_ndx(index-1)
    end
  end
  
  describe "Base" do
    before(:each) do
      @base = UnityArray.new 20
      @parser = Positional::MaskedParse.new @base.extend Positional::Decorator::Index
    end
    
    it "should parse gene sequences" do
      obj = @parser.parse 'GCTACTGCAAGTTCTAGACT'
      obj.should_not be_nil
      obj[1].should == 'G'
      obj[2].should == 'C'
      obj[20].should == 'T'
    end
  end
  
  describe "SequenceQuality" do
    before(:each) do
      @qs = UnityArray.new 20
      @parser = Positional::Parse.new @qs.extend Positional::Decorator::Index
    end
    
    it "should parse gene quality sequences" do
      obj = @parser.parse '1 8 15 22 60 55 57 56 58 55 60 58 57 59 55 50 44 18 5 6'
      obj[1].should == 1
      obj[2].should == 8
      obj[6].should == 55
      obj[20].should == 6
    end
  end
end