class OneHouse < State
  def allProperty
    @context.transition_to(AllProperty.new)
  end

  def twoHouses
    @context.transition_to(TwoHouses.new)
  end
end
