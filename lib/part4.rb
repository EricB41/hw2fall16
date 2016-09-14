#DISCLAIMER: Used the code for guidance: http://stackoverflow.com/questions/9561072/ruby-using-class-eval-to-define-methods


class Class

  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    instance_variable_set "@#{attr_name}_history", [attr_name]
    class_eval %Q"
      @#{attr_name}_history = []
      def #{attr_name}=(newVal)
        if !defined? @#{attr_name}_history
          @#{attr_name}_history = []
          @#{attr_name}_history.push(nil)
        end
        @#{attr_name}_history.push(newVal)
        @#{attr_name} = newVal
      end
      "
  end
end

class Foo
  attr_accessor_with_history :bar
  
  def initialize()
    
  end
end

f = Foo.new
f.bar= 1
f.bar= 2
f.bar_history