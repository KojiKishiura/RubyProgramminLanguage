#Interators & Material
3.times { print "Ruby! " }          # Output:Ruby! Ruby! Ruby!
1.upto(9) { |x| print x }           # Output:123456789
puts
puts "------------------------------------------------------------"
a = [3,2,1]                         # Array
a[3] = a[2] - 1                     # Get Array material
puts a[0]
puts a[1]
puts a[2]
puts a[3]
a.each do |elt|                     # iterators:each blocks:elt
    print elt + 1                   # Output:4321
end                                 # do-end
puts
puts "------------------------------------------------------------"
a = [1,2,3,4]                       # Array
b = a.map {|x| x*x}                 # square
puts b
c = a.select {|x| x%2 == 0}         # Even
puts c
a.inject do |sum,x|                 # Summation
    sum + x
end
puts
puts "------------------------------------------------------------"
#Hash
h = {								# Hash Map to Value 
    :one => 1,                      # '=>':Mapping key=>value
    :two => 2                       # ':':simbol Literal
}
h[:one]                             # => 1 Access to value by key
h[:three] = 3                       # Add a new key-value pairs
h.each do |key,value|               # Iterate through the key-value pairs
    # Change String by to_s method:式展開
    print "#{value}:#{key}; "       # Substitution Variable to String
end                                 # Output:2:two; 3:three; 1:one; 
puts
puts "------------------------------------------------------------"
File.open("data.txt") do |f|        # Open a file and pass the stream to the block
    line = f.readline               # Read a file using stream\
    print line
end
	
t = Thread.new do                   # To run on new thread
    File.read("data.txt")           # Read a file by background
end                                 # The contents of the file can be referenced as the value of the thread

puts
puts "------------------------------------------------------------"
    