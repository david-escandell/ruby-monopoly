class FourHouses < State
  def threeHouses
    @context.transition_to(ThreeHouses.new)
  end

  def hotel
    @context.transition_to(Hotel.new)
  end
end
