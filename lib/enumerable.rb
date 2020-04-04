module Enumerable
    def my_each
        for i in 0...self.length
            yield(self[i])
        end
    end

    def my_each_with_index
        for i in 0...self.length
            yield(self[i], i)
        end
    end

    def my_select
        if block_given?
            selection = []
            self.my_each {|val| selection.push(val) if yield(val)}
            selection
        else
            "#<Enumerator: [#{self.join(",")}]:my_select>"
        end
    end

    def my_all?
        self.my_each { |val| return false unless yield(val)}
        true
    end

    def my_any?
        self.my_each { |val| return true if yield(val)}
        false
    end

    def my_none?
        self.my_each { |val| return false if yield(val)}
        true
    end

    def my_count
        count = 0
        self.my_each { |val| count += 1 if yield(val)}
        count
    end
=begin
    def my_map
        map = []
        self.my_each { |val| map.push(yield(val))}
        map
    end
=end
=begin
    def my_map &proc_0
        map = []
        self.my_each { |val| map.push(proc_0.call(val))}
        map
    end
=end
    def my_map &proc_0
        map = []
        if !proc_0.nil?
            self.my_each { |val| map.push(proc_0.call(val))}
        elsif block_given?
            self.my_each { |val| map.push(yield(val))}
        end
        map
    end

    def my_inject initial=self[0]
        result = initial
        self.my_each {|val| result = yield(result, val)}
        result
    end

end
=begin
def multiply_els vals
    vals.my_inject(1) {|m, val| m * val}
end

ar = [1, 2, 3]

ar.each { |a| print "#{a} " }
puts
ar.my_each { |a| print "my #{a} " }
puts

ar.each_with_index { |a, o| print "#{o} " }
puts
ar.my_each_with_index { |a, o| print "my #{o} " }
puts

puts (ar.select { |val| val % 2 == 0}).to_s
puts "my #{(ar.my_select { |val| val % 2 == 0})}"

puts ar.all? {|a| a == 1}
puts "my #{ar.my_all? {|a| a == 1}}"

puts ar.any? {|a| a == 1}
puts "my #{ar.my_any? {|a| a == 1}}"

puts multiply_els([2,4,5])

proc = Proc.new {|i| i**2}
puts ar.my_map(&proc).to_s
puts ar.my_map {|i| i**2}.to_s

=end