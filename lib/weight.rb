require "weight/all"

class Weight
  include Comparable
  include Weight::Configuration

  # Class contructor
  # @param value [Int] The weight of the object
  # @param unit [String] The unit in which the value is expressed. Currently
  #   supports 'lb' and 'kg'
  # @raise [TypeError] When weight is negative
  def initialize(value = 0, unit = default_unit)
    self.value, self.unit = value, unit
  end

  def value
    @input_value
  end

  def unit
    @input_unit
  end

  # Returns the weight converted to pounds
  # @return [Float] The weight in pounds
  def to_kgs
    round(raw_data_in_kg)
  end

  # Returns the weight converted to kilograms
  # @return [Float] The weight in kilograms
  def to_lbs
    round(raw_data_in_kg * pounds_per_kilogram)
  end

  # Returns the weight converted to pounds
  # @return [Float] The weight in pounds
  def to_f
    round(value.to_f)
  end

  # Returns the weight in pounds rounded to the closest integer
  # @return [Int] The weight in pounds rounded
  def to_i
    value.round
  end

  # Addition operation
  # @param other [Weight] The other weight to add to the current one
  # @return [Weight] The sum of the two weights
  # @raise [TypeError] When the argument passed is not a Weight
  def +(other)
    raise TypeError, 'You can only add weights' unless other.is_a?(Weight)
    self.class.new(value + other_value(other), unit)
  end

  # Comparison operator
  # @param other [Weight] The other weight to compare to the current one
  # @return [Bool] True if both of the objects have the same weight. False
  #   otherwise
  # @raise [TypeError] When the argument passed is not a Weight
  def ==(other)
    raise TypeError, 'You can only compare weights' unless other.is_a?(Weight)
    self.to_kgs  == other.to_kgs
  end

  # Comparison operator
  # @param other [Weight] The other weight to compare to the current one
  # @return [-1,0,1]
  # @raise [TypeError] When the argument passed is not a Weight
  def <=>(other)
    raise TypeError, 'You can only compare weights' unless other.is_a?(Weight)
    self.to_kgs <=> other.to_kgs
  end

  # Substract operation
  # @param other [Weight] The other weight to substract to the current one
  # @return [Weight] The substraction of the two weights
  # @raise [TypeError] When the argument passed is not a Weight
  def -(other)
    raise TypeError, 'You can only substract weights' unless other.is_a?(Weight)
    self.class.new(value - other_value(other), unit)
  end

  # Multiplication operation
  # @param other [Weight] The other weight to multiply by the current one
  # @return [Weight] The product of the two weights
  # @raise [TypeError] When the argument passed is not a Weight
  def *(other)
    raise TypeError, 'You can only multiply a weight by a number' unless other.is_a?(Numeric)
    self.class.new(value * other, unit)
  end

  # Division operation
  # @param other [Weight] The weight to divide the current one by
  # @return [Weight] The result of the operation
  # @raise [TypeError] When the argument passed is not a Weight
  def /(other)
    raise TypeError, 'You can only divide a weight by a number' unless other.is_a?(Numeric)
    self.class.new(value / other, unit)
  end

  private

  # Helper method return value for other object in current object unit system
  def other_value(other)
    case unit
    when :kg
      other.to_kgs
    when :lb
      other.to_lbs
    end
  end

  def round(value)
    sprintf("%0.0#{round_level}f", value.to_f).to_f
  end

  # The weight expressed in kilograms for internal usage
  # @return [Float] The weight in pounds
  # @raise [TypeError] When the unit passed was neither kg nor lb
  def raw_data_in_kg
    case unit
    when :kg
      value
    when :lb
      value / pounds_per_kilogram
    else
      raise TypeError, 'Unit is neither kg nor lb'
    end
  end

  def value=(value)
    raise TypeError, 'Weight cannot be negative' if value < 0
    raise TypeError, 'Weight value should be Numeric' unless value.is_a? Numeric
    @input_value = value
  end

  def unit=(unit)
    unit = unit.to_s.downcase.to_sym
    raise ArgumentError, "You should use one from allowe unit tipes #{allowed_units.inspect}" unless allowed_units.include?(unit)
    @input_unit = unit
  end

  # The conversion rate between pounds and kilograms
  # @return [Float] The number of pounds in a kilogram
  def pounds_per_kilogram
    2.2046
  end
end
