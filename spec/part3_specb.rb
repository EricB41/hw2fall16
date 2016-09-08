require 'part3.rb'

testDessert = Dessert.new("Hello", 2)
testJellyBean = JellyBean.new("JellyBean", 201, "random")

describe "dessert" do
  it "should define a constructor" do
#    lambda { Dessert.new('a', 1) }.should_not raise_error
    expect(lambda {Dessert.new('a', 1)}).not_to raise_error
  end
  %w(:healthy? :delicious?).each do |method|
    it "should define #{method}" do
#      Dessert.new('a',1).should respond_to method
      expect(Dessert.new('a',1)).to respond_to(method)
    end
  end
  
  it "should have getters and setters for @name and @calories" do
    expect(Dessert.new("hey", 2).name()).to eq("hey")
    expect(Dessert.new("hey", 201).calories()).to eq(201)
    testDessert.name=("xyz")
    expect(testDessert.name()).to eq("xyz")
    testDessert.calories=(1234)
    expect(testDessert.calories()).to eq(1234)
  end
  
  it "should have method healthy? return true if dessert has less than 200 calories" do
    expect(Dessert.new('a', 1).healthy?).to eq(true)
    expect(Dessert.new('a', 199).healthy?).to eq(true)
    expect(Dessert.new('a', 200).healthy?).to eq(false)
    expect(Dessert.new('a', 250).healthy?).to eq(false)
  end
  
  it "should have method delicious? return true always" do
    expect(Dessert.new('XIT', 1).delicious?).to eq(true)
    expect(Dessert.new('HELLO', 201).delicious?).to eq(true)
  end
end

describe "jellybean" do
  it "should define a constructor" do
#    lambda { JellyBean.new('a', 1, 2) }.should_not raise_error
    expect(lambda { JellyBean.new('a', 1, 2) }).not_to raise_error
  end
  %w(:healthy? :delicious? ).each do |method|
    it "should define #{method}" do
#      JellyBean.new('a',1, 2).should respond_to method 
      expect(JellyBean.new('a',1, 2)).to respond_to(method) 
    end
  end
  
  it "should have getters and setters for @name and @calories" do
    expect(JellyBean.new("hey", 2, "test").name()).to eq("hey")
    expect(JellyBean.new("hey", 201, "test").calories()).to eq(201)
    expect(JellyBean.new("hey", 201, "test").flavor()).to eq("test")
    testJellyBean.name=("xyz")
    expect(testJellyBean.name()).to eq("xyz")
    testJellyBean.calories=(1234)
    expect(testJellyBean.calories()).to eq(1234)
    testJellyBean.flavor=("test2")
    expect(testJellyBean.flavor()).to eq("test2")
    
  end
  
  it "should have method healthy? return true if dessert has less than 200 calories" do
    expect(JellyBean.new('a', 1, "test").healthy?).to eq(true)
    expect(JellyBean.new('a', 199, "test").healthy?).to eq(true)
    expect(JellyBean.new('a', 200, "test").healthy?).to eq(false)
    expect(JellyBean.new('a', 250, "test").healthy?).to eq(false)
  end
  
  it "should have method delicious? return true only if the flavor is not 'Black Licorice'" do
    expect(JellyBean.new('XIT', 1, "test").delicious?).to eq(true)
    expect(JellyBean.new('HELLO', 1, "Black Licorice").delicious?).to eq(false)
  end
  
  #it "should have method healthy? return true if a dessert has less than 200 calories"
end
