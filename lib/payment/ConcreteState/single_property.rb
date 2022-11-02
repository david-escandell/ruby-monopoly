class SingleProperty < State
  def allProperty
    @context.transition_to(AllProperty.new)
  end

  def mortgage
    @context.transition_to(Mortgage.new)
  end

  def payment
    return 8
  end
end
