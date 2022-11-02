class Mortgage < State
  def singleProperty
    @context.transition_to(SingleProperty.new)
  end

  def allProperty
    @context.transition_to(AllProperty.new)
  end

  def payment
    puts "No Cost"
  end

end
