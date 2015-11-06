
# Tail call optimization
# Source: http://jabberwocky.eu/2010/11/23/tail-call-optimization/
#
# Usage (on the folder):
#
# $ bundle install
#
# $ ruby tail.rb  # show stack error
# $ XTAIL=true ruby tail.rb # works!

begin
  require "method_source"
rescue LoadError => e
  raise "Run bundle install to install method_source gem"
end

module Interception

  RubyVM::InstructionSequence.compile_option = {
    :tailcall_optimization => true,
    :trace_instruction => false
  }

  # Dirty Dance :P
  def compile_with_tail(str_method)
    str_method = %{
      class #{self.to_s}
        #{str_method}
      end
    }
    RubyVM::InstructionSequence.new(str_method).eval
  end

  def xtail(method)
    m = self.instance_method(method)
    self.send(:undef_method, method)
    compile_with_tail(m.source)
  end

end

class TCOTest

  extend Interception

  # tail-recursive factorial
  compile_with_tail %{
    def fact_with_tail( n, acc = 1 )
      if n < 2 then acc else fact_with_tail( n-1, n*acc ) end
    end
  }

  def fact( n, acc = 1 )
    if n < 2 then acc else fact( n-1, n*acc ) end
  end
  xtail(:fact) if ENV['XTAIL']

  # length of factorial
  def fact_size( n )
    fact( n ).size
  rescue
    $!
  end

end

def print_number(gigant_number)
  puts "#{gigant_number.to_s[0..20]}... "
end

NUMBER_STACK_EXPLOSION = 10000
begin
  puts "### fact"
  print_number TCOTest.new.fact(NUMBER_STACK_EXPLOSION)
rescue Exception => e
  puts e.inspect
end

puts "### fact_with_tail"
print_number TCOTest.new.fact_with_tail(NUMBER_STACK_EXPLOSION)
