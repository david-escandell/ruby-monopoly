class ThreeHouses < State
  def twoHouses
    @context.transition_to(TwoHouses.new)
  end

  def fourHouses
    @context.transition_to(FourHouses.new)
  end

  def payment
    return 8
  end
end
