class TwoHouses < State
  def oneHouse
    @context.transition_to(OneHouse.new)
  end

  def threeHouses
    @context.transition_to(ThreeHouses.new)
  end

  def payment
    return 8
  end
end
