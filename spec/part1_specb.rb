require 'part1.rb'

expectedHash1 = {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
expectedHash2 = {'doo' => 3, 'bee' => 2}
# John's canoe is like it should be.,;:if it9 is John's *()-~!@#$%^+=`?><|}{[]can_oe.,;:
expectedHash3 = {'john\'s' => 2, 'canoe' => 1, 'is' => 2, 'like' => 1, 'it' => 1,
                'should' => 1, 'be' => 1, 'if' => 1, 'it9'=> 1, 'can_oe'=> 1}

describe "#palindrome?" do
  it "should be defined" do
 #   lambda { palindrome?("Testing") }.should_not raise_error
    expect(lambda {palindrome?("Testing")}).not_to raise_error
  end
  
  it "should correctly identify palindromes" do
     expect(palindrome?("there goes the neighborhood")).to eq(false) 
     expect(palindrome?("Madam, I'm Adam")).to eq(true) 
     expect(palindrome?("Madam, I'^m Adam")).to eq(true) 
     expect(palindrome?("A man, a plan, a canal -- Panama")).to eq(true) 
     expect(palindrome?("Abracadabra")).to eq(false) 
     expect(palindrome?("----a&$*()A&!@#*$(#")).to eq(true) 
  end
end

describe "#count_words" do
  it "should be defined" do
#    lambda { count_words("Testing") }.should_not raise_error
    expect(lambda{count_words("Testing")}).not_to raise_error
  end
  it "should return a Hash" do
#    count_words("Testing").class.should == Hash
    expect(count_words("Testing")).to be_a_kind_of(Hash) 
  end
  
  it "should correctly count the words and store them in a hash" do
     expect(count_words("A man, a plan, a canal -- Panama")).to eq(expectedHash1) 
     expect(count_words("Doo bee doo bee doo")).to eq(expectedHash2) 
     expect(count_words("John's canoe is like it should be.,;:if it9 is John's *()-~!@#$%^+=`?><|}{[]can_oe.,;:")).to eq(expectedHash3)
  end
end
