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
print "test1: "
result = calc.addition(2,3)
if result == 5
	print "OK\n"
else 
	print "FAIL\n"
end

print "test2: "
result = calc.addition("hello",3)
if result == "NaN"
	print "OK\n"
else 
	print "FAIL\n"
end

print "test3: "
result = calc.substraction(2,3)
if result == -1
	print "OK\n"
else 
	print "FAIL\n"
end

print "test4: "
result = calc.substraction([],3)
if result == "NaN"
	print "OK\n"
else 
	print "FAIL\n"
end

print "test5: "
result = calc.multiplication(2,3)
if result == 6
	print "OK\n"
else 
	print "FAIL\n"
end

print "test6: "
result = calc.multiplication({},3)
if result == "NaN"
	print "OK\n"
else 
	print "FAIL\n"
end

print "test7: "
result = calc.division(2,3)
if result == 0
	print "OK\n"
else 
	print "FAIL\n"
end

print "test8: "
result = calc.division(:symbol,3)
if result == "NaN"
	print "OK\n"
else 
	print "FAIL\n"
end