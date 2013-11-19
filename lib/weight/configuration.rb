module Weight::Configuration
  module_function

  def self.configure
    yield self if block_given?
  end

  def default_unit=(weight_unit_code)
    default_unit = weight_unit_code.to_s.downcase.to_sym
    raise ArgumentError unless allowed_units.include?(default_unit)
    @@default_unit = default_unit
  end

  def default_unit
    @@default_unit ||= :kg
  end

  def round_level
    @round_level ||= 4
  end

  def allowed_units
    [:kg, :lb]
  end
end
