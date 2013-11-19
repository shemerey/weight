require 'spec_helper'

describe Weight::Configuration do
  describe '#default configuraiton' do
    it 'should be kilogram by default' do
      described_class.system_unit.should == :kg
    end
  end

  describe 'only :lb, :kg allowed' do
    it 'raise ArgumentError if system_unit not in allowed list [:kg, :lb]' do
      expect {
        described_class.system_unit = 'g'
      }.to raise_error(ArgumentError)
    end
  end

  describe '#configure system_unit as lb' do
    ['lb', 'Lb', 'lB', 'LB', :lb, :Lb, :lB, :LB].each do |lb|
      it "should be lb if we configure it with #{lb} as a system_unit" do
        described_class.system_unit = lb
        described_class.system_unit.should == :lb
      end
    end
  end

  describe '#configure system_unit as kg' do
    ['kg', 'Kg', 'kG', 'KG', :kg, :Kg, :kG, :KG].each do |kg|
      it "should be kg if we configure it with #{kg} as a system_unit" do
        described_class.system_unit = kg
        described_class.system_unit.should == :kg
      end
    end
  end
end

