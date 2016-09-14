class CartesianProduct
  include Enumerable
  
  def initialize(seq1, seq2)
    @cartesian = Array.new
    seq1.each do |curr1|
      seq2.each do |curr2|
        @cartesian.push([curr1, curr2])
      end
    end
  end
  
  def each
    @cartesian.each {|curr_element| yield curr_element}
  end

end