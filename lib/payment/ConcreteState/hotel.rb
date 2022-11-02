class Hotel < State
  def fourHouses
    @context.transition_to(FourHouses.new)
  end
end
