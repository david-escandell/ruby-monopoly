class AllProperty < State
  def singleProperty
    puts 'AllProperty handles singleProperty.'
    @context.transition_to(SingleProperty.new)
  end

  def oneHouse
    puts 'AllProperty handles oneHouse.'
    puts 'AllProperty wants to change the state of the context.'
    @context.transition_to(OneHouse.new)
  end

  def mortgage
    puts 'AllProperty handles mortgage.'
    puts 'AllProperty wants to change the state of the context.'
    @context.transition_to(Mortgage.new)
  end

  def payment
    return 8
  end
end
