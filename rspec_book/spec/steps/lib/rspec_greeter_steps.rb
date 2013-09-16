step "a greeter" do
  @greeter = RSpecGreeter.new
end

step "I send it the greet message" do
  @message = @greeter.greet_turnip
end

step "I should see :word" do |word|
  expect(@message).to eq(word)
end
