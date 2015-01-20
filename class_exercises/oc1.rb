class Lexiconomitron
	def devores_T(string)
		return nil unless string.is_a?(String)
		string.gsub("t","").gsub("T","")
	end

	def shazam(array)
		return nil unless array.is_a?(Array)
		result = array.map { |i| devores_T(i).reverse }
		[result.first, result.last]
	end

	def oompa_loompa(array)
		return nil unless array.is_a?(Array)
		array.map { |i| return nil unless i.is_a?(String) }
		result = array.select { |i| i.length <= 3 }
		result.each {|i| devores_T(i) }
	end

	def all_in_line(array,string)
		return nil unless array.is_a?(Array)
		return nil unless string.is_a?(String)
		array.join(string)
	end

	def supercounter(array)
		return nil unless array.is_a?(Array)
		counter = 0
		array = array.join("")
		[*0 .. array.size - 1].map do |i|
			if array[i].downcase.ord < "t".ord
				counter += 1
			end
		end
		counter
	end
end

describe Lexiconomitron do
	before do
		@lexic = Lexiconomitron.new
	end 
	describe "#devores_T" do
		it "shoudl be return the string without t's" do
			expect(@lexic.devores_T("this is an string")).to eq("his is an sring")
		end
		it "should be return nil if it's not an string" do
			expect(@lexic.devores_T([1,2,3])).to be(nil)
		end
	end
	describe "#shazam" do
		it "should be return the reverse without t's" do
			expect(@lexic.shazam(["This", "is", "a", "boring", "test"])).to eq(["sih", "se"])
		end
		it "should be return nil if it's not an array" do
			expect(@lexic.shazam(1)).to be(nil)
		end
	end
	describe "#oompa loompa" do
		it "should be return the words with 3 lettrs or less without t's" do
			expect(@lexic.oompa_loompa(["if", "you", "wanna", "be", "my", "lover"])).to eq(["if", "you","be", "my"])
		end
		it "should be return nil if it's not an array" do
			expect(@lexic.oompa_loompa([1,2,3])).to be(nil)
		end
	end

	describe "#all_in_line" do
		it "should be return the words of the array separated by the string" do
			expect(@lexic.all_in_line(["if", "you", "wanna"], "&")).to eq("if&you&wanna")
		end
		it "should be return nil if it's not an array" do
			expect(@lexic.all_in_line(2,"hello")).to be(nil)
		end
	end

	describe "#supercounter" do
		it "should be return the words of the array separated by the string" do
			expect(@lexic.supercounter(["I", "am", "getting", "tired", "of", "your", "words"])).to eq(20)
		end
		it "should be return nil if it's not an array" do
			expect(@lexic.supercounter("hello")).to be(nil)
		end
	end
end