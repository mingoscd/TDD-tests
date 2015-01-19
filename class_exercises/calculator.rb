# We’ll start with something nice and easy so we learn this testing thing quickly.
# Write a class, called Calculator, that basically performs all four basic math operations: addition, substraction, multiplication and
# division. In order to keep it simple, all of them will have two numeric parameters.
# After writing your class, write several tests. For each one, print “OK” if it succeeded, “FAIL” otherwise, in order to test that
# everything is working out properly.

class Calculator

	def addition(n1, n2)
		if n1.is_a?(Numeric) && n2.is_a?(Numeric)
			return n1 + n2
		else
			return "NaN"
		end
	end

	def substraction(n1,n2)
		if n1.is_a?(Numeric) && n2.is_a?(Numeric)
			return n1 - n2
		else
			return "NaN"
		end
	end

	def multiplication(n1,n2)
		if n1.is_a?(Numeric) && n2.is_a?(Numeric)
			return n1 * n2
		else
			return "NaN"
		end
	end

	def division(n1,n2)
		if n1.is_a?(Numeric) && n2.is_a?(Numeric)
			return n1 / n2
		else
			return "NaN"
		end
	end

end

p "==CALCULATOR TESTS=="
calc = Calculator.new

p "Addition"
print "test1: "
result = calc.addition(2,3)
if result == 5
	p "OK"
else 
	p "FAIL"
end

print "test2: "
result = calc.addition("hello",3)
if result == "NaN"
	p "OK"
else 
	p "FAIL"
end

p "\nSubstraction"
print "test3: "
result = calc.substraction(2,3)
if result == -1
	p "OK"
else 
	p "FAIL"
end

print "test4: "
result = calc.substraction([],3)
if result == "NaN"
	p "OK"
else 
	p "FAIL"
end

p "\nMultiplication"
print "test5: "
result = calc.multiplication(2,3)
if result == 6
	p "OK"
else 
	p "FAIL"
end

print "test6: "
result = calc.multiplication({},3)
if result == "NaN"
	p "OK"
else 
	p "FAIL"
end

p "\nDivision"
print "test7: "
result = calc.division(2,3)
if result == 0
	p "OK"
else 
	p "FAIL"
end

print "test8: "
result = calc.division(:symbol,3)
if result == "NaN"
	p "OK"
else 
	p "FAIL"
end



#### class SOLUTION ####

#more short method to test.

def assert(result, expectation)
	if result == expectation
		puts "OK"
	else 
		puts "FAIL"
	end
end


assert(calculator.addition(5,6), 11)


#### TESTING WITH RSPEC ####

before Calculator do
	@calculator = Calculator.new
end

describe Calculator do 
	describe "#addition" do 
		it "should add 5 and 6" do
			expect(Calculator.new.addition(5,6)).to eq(11)
		end
		it "should add 0 and 4" do
			expect(Calculator.new.addition(0,4)).to eq(4)
		end
	end
end


end



