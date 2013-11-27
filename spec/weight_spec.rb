require 'spec_helper'

describe Weight do
  let(:described_class) { Weight }

  let(:one_kg) { described_class.new(1, 'kg') }
  let(:two_kg) { described_class.new(2, 'kg') }

  let(:one_lb) { described_class.new(1, 'lb') }
  let(:two_lb) { described_class.new(2, 'lb') }
  let(:three_lb) { described_class.new(3, 'lb') }

  let(:another_lb) { described_class.new(1, 'lb') }

  it 'should take two options value and unit type' do
    described_class.new(1, 'lb').should be_instance_of(described_class)
  end

  describe 'basic mas calculation' do
    it 'for - operator result unit should be first == to first object unit' do
      (one_kg - one_lb).unit.should == :kg
    end

    it 'for - operator result unit should be first == to first object unit' do
      (three_lb - one_kg).unit.should == :lb
    end

    it 'for + operator result unit should be first == to first object unit' do
      (one_kg + one_lb).unit.should == :kg
    end

    it 'for + operator result unit should be first == to first object unit' do
      (one_lb + one_kg).unit.should == :lb
    end

    it '[-] should compute weight objects with different units properly' do
      (one_kg - one_lb).should > one_lb
      (one_kg + one_lb).should < two_kg
    end

    it '[+] should compute weight objects with different units properly' do
      (one_kg + one_lb).should < two_kg
      (one_kg + one_lb).should > two_lb
    end

    it '1 lb + 1 lb should be 2 lbs' do
      (one_lb + one_lb).should == two_lb
    end

    it 'two objects with the same weight and type should be equal' do
      one_lb.should == another_lb
    end

    it '2 lbs - 1 lb should be 1 lb' do
      (two_lb - one_lb).should == one_lb
    end

    it '2 times 1 lb should be 2 lbs' do
      (one_lb * 2).should == two_lb
    end

    it 'attempting to add a weight to something that is not a weight should raise an error' do
      expect do
        (one_lb + 1)
      end.to raise_error(TypeError)
    end

    it 'attempting to substract from a weight something that is not a weight should raise an error' do
      expect do
        (one_lb - 1)
      end.to raise_error(TypeError)
    end

    it 'attempting to multiply a weight by another weight should raise an error' do
      expect do
        (one_lb * one_lb)
      end.to raise_error(TypeError)
    end

    it '1 kg multipied by two should be 2 kg' do
      (one_kg * 2).should == two_kg
    end

    it '2 kgs divided by two should be 1 kg' do
      (two_kg / 2).should == one_kg
    end

    it '2 lbs divided by two should be 1 lbs' do
      (two_lb / 2).should == one_lb
    end

    it 'attempting to divide a weight by another weight should raise an error' do
      expect do
        (two_lb / two_lb)
      end.to raise_error(TypeError)
    end
  end

  describe 'calculation between different units' do
    it 'should convert 1 kg to 2.2046 lbs' do
      described_class.new(1, 'kg').to_lbs.should == 2.2046
    end

    it 'should convert 1 lbs to 0.45359 kg' do
      described_class.new(1, 'lb').to_kgs.should == 0.4536
    end

    it 'should convert 0 kgs to 0 lb' do
      described_class.new(0, 'kg').to_lbs.should == 0.0
    end

    it 'should convert 0 lbs to 0 kg' do
      described_class.new(0, 'lb').to_kgs.should == 0.0
    end

    it 'should raise an error when the weight in kgs is negative' do
      expect do
        described_class.new(-1, 'kg')
      end.to raise_error(TypeError)
    end

    it 'should raise an error when the weight in lbs is negative' do
      expect do
        described_class.new(-1, 'lb')
      end.to raise_error(TypeError)
    end

    it 'should return the weight in pounds when converted to_f' do
      described_class.new(0.6, 'lb').to_f.should == 0.6
    end

    it 'should round 0.6 lbs to 1 lb when converted to_i' do
      described_class.new(0.6, 'lb').to_i.should == 1
    end

    it 'should round 0.5 lbs to 1 lb when converted to_i' do
      described_class.new(0.5, 'lb').to_i.should == 1
    end

    it 'should round 0.4 lbs to 0 lb when converted to_i' do
      described_class.new(0.4, 'lb').to_i.should == 0
    end
  end

  describe 'comparison of different weights' do
    it 'two lb more than two' do
      two_lb.should be > one_lb
    end

    it 'two lb more or eql than two' do
      two_lb.should be >= two_lb
    end

    it 'one lb less than two' do
      one_lb.should be < two_lb
    end

    it 'attempting to compare a weight to something that is not a weight should raise an error' do
      expect do
        (one_lb == 1)
      end.to raise_error(TypeError)
    end
  end
end
