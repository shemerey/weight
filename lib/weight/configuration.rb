module Weight::Configuration
  module_function

  def self.configure
    yield self if block_given?
  end

  def system_unit=(weight_unit_code)
    system_unit = weight_unit_code.to_s.downcase.to_sym
    raise ArgumentError unless allowed_units.include?(system_unit)
    @@system_unit = system_unit
  end

  def system_unit
    @@system_unit ||= :kg
  end

  def allowed_units
    [:kg, :lb]
  end
end
