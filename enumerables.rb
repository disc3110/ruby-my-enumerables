# rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
# MY ENUMERABLES
module Enumerable
  # my_all? ------------
  def my_all?(parameter = nil)
    my_each do |x|
      if block_given?
        return false unless yield x
      elsif parameter.is_a?(Regexp)
        return false unless parameter.match?(x)
      elsif parameter.is_a?(Class)
        return false unless x.is_a?(parameter)
      elsif parameter.nil?
        return false unless x
      else
        return false unless x == parameter
      end
    end
    true
  end

  # my_any?
  def my_any?(parameter = nil)
    my_each do |x|
      if block_given?
        return true if yield x
      elsif parameter.is_a?(Class)
        return true if x.is_a?(parameter)
      elsif parameter.is_a?(Regexp)
        return true if parameter.match?(x)
      elsif parameter.nil?
        return true if x
      elsif x == parameter
        return true
      end
    end
    false
  end

  def filter(_parameter = nil)
    result = []
    each do |x|
      result.push(x) if yield(x)
    end
    result
  end
end

# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
