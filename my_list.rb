require_relative 'enumerables'
class MyList
  include Enumerable
  def initialize(*list)
    @list = list
  end

  # my_each
  def my_each(*)
    arr = self if instance_of?(Array)
    arr = to_a if instance_of?(Range)
    i = 0
    while i < arr.length
      yield(arr[i])
      i += 1
    end
    self
  end

  def each
    @list.each { |e| yield(e) if block_given? }
  end
end

list = MyList.new(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

# Test #all?
puts(list.all? { |e| e < 11 }) # true
puts(list.all? { |e| e > 7 }) # false
puts(list.all?(Numeric)) # true
# Test #any?
puts(list.any? { |e| e == 8 }) # true
puts(list.any? { |e| e == 40 }) # false
puts(list.all?(String)) # false
# Test #filter
p(list.filter { |x| x > 4 }) # 5-10
p(list.filter { |x| x < 8 }) # 1-7
