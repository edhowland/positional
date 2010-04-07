require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Format" do
  class CoilSelectionCoolingInput
   attr  :elevation, :fluid, :concentration, :tube_side_fz_temp,
      :ent_air_drybulb, :ent_air_wetbulb, :ent_liquid_temp,
      :air_flow_rate, :air_flow_flag, :face_area, :face_velocity, :coil_height, 
      :coil_width, :fin_type, :total_heat_transfer, :leave_air_drybulb, :leave_air_wetbulb,
      :leave_air_dewpoint, :liquid_flow_rate, :leave_liquid_temp, :liquid_temp_rise,
      :max_allow_liquid_head_loss, :max_allow_air_pressure_loss, :max_fins, :connextion
    def initialize
      @elevation = 0
      @fluid=1
      @concentration=0
      @tube_side_fz_temp=32
      @ent_air_drybulb=95
      @ent_air_wetbulb=78
      @ent_liquid_temp=45
      @air_flow_rate=10000
      @air_flow_flag=1
      @face_area=0
      @face_velocity=500 
      @coil_height=48
      @coil_width=0 
      @fin_type=1 
      @total_heat_transfer=0 
      @leave_air_drybulb=55 
      @leave_air_wetbulb=0
      @leave_air_dewpoint=0
      @liquid_flow_rate=0 
      @leave_liquid_temp=0 
      @liquid_temp_rise=12
      @max_allow_liquid_head_loss=15 
      @max_allow_air_pressure_loss=1.5 
      @max_fins=8
      @connextion=1
    end
    
  end
  before(:each) do
    fmt = [:elevation, :fluid, :concentration, :tube_side_fz_temp,
      :ent_air_drybulb, :ent_air_wetbulb, :ent_liquid_temp,
      :air_flow_rate, :air_flow_flag, :face_area, :face_velocity, :coil_height, 
      :coil_width, :fin_type, :total_heat_transfer, :leave_air_drybulb, :leave_air_wetbulb,
      :leave_air_dewpoint, :liquid_flow_rate, :leave_liquid_temp, :liquid_temp_rise,
      :max_allow_liquid_head_loss, :max_allow_air_pressure_loss, :max_fins, :connextion]
    object = CoilSelectionCoolingInput.new
    @formatter = Positional::Format.new fmt, object
    
  end
  it "should equal coildselectioncooling input" do
    @formatter.to_s.should == "0 1 0 32 95 78 45 10000 1 0 500 48 0 1 0 55 0 0 0 0 12 15 1.5 8 1"
  end
end
