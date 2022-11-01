
# The Context defines the interface of interest to clients. It also maintains a
# reference to an instance of a State subclass, which represents the current
# state of the Context.
class Context
  # A reference to the current state of the Context.
  attr_accessor :state
  private :state

  # @param [State] state
  def initialize(state)
    transition_to(state)
  end

  # The Context allows changing the State object at runtime.
  def transition_to(state)
    puts "Context: Transition to #{state.class}"
    @state = state
    @state.context = self
  end

  # The Context delegates part of its behavior to the current State object.

  def singleProperty
    @state.singleProperty
  end

  def allProperty
    @state.allProperty
  end

  def oneHouse
    @state.oneHouse
  end

  def twoHouses
    @state.twoHouses
  end

  def threeHouses
    @state.threeHouses
  end

  def fourHouses
    @state.fourHouses
  end

  def hotel
    @state.hotel
  end


  def mortgage
    @state.mortgage
  end
end

# The base State class declares methods that all Concrete State should implement
# and also provides a backreference to the Context object, associated with the
# State. This backreference can be used by States to transition the Context to
# another State.
class State
  attr_accessor :context

  def rent
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

end

# Concrete States implement various behaviors, associated with a state of the
# Context.

class ConcreteStateSingleProperty < State
  def allProperty
    puts 'ConcreteStateSingleProperty handles singleProperty.'
    puts 'ConcreteStateSingleProperty wants to change the state of the context.'
    @context.transition_to(ConcreteStateAllProperty.new)
  end

  def singleProperty
    puts 'ConcreteStateSingleProperty handles singleProperty.'
  end

  def mortgage
    puts 'ConcreteStateSingleProperty handles mortgage.'
    puts 'ConcreteStateSingleProperty wants to change the state of the context.'
    @context.transition_to(ConcreteStateMortgage.new)
  end

  def rent
    return 8
  end
end

class ConcreteStateAllProperty < State
  def singleProperty
    puts 'ConcreteStateAllProperty handles singleProperty.'
    @context.transition_to(ConcreteStateSingleProperty.new)
  end

  def oneHouse
    puts 'ConcreteStateAllProperty handles oneHouse.'
    puts 'ConcreteStateAllProperty wants to change the state of the context.'
    @context.transition_to(ConcreteStateOneHouse.new)
  end

  def mortgage
    puts 'ConcreteStateAllProperty handles mortgage.'
    puts 'ConcreteStateAllProperty wants to change the state of the context.'
    @context.transition_to(ConcreteStateMortgage.new)
  end
end

class ConcreteStateOneHouse < State
  def allProperty
    puts 'ConcreteStateOneHouse handles allProperty.'
    @context.transition_to(ConcreteStateAllProperty.new)
  end

  def twoHouses
    puts 'ConcreteStateAllProperty handles twoHouses.'
    puts 'ConcreteStateAllProperty wants to change the state of the context.'
    @context.transition_to(ConcreteStateTwoHouses.new)
  end
end

class ConcreteStateTwoHouses < State
  def oneHouse
    puts 'ConcreteStateTwoHouses handles oneHouse.'
    @context.transition_to(ConcreteStateOneHouse.new)
  end

  def threeHouses
    puts 'ConcreteStateTwoHouses handles threeHouses.'
    puts 'ConcreteStateTwoHouses wants to change the state of the context.'
    @context.transition_to(ConcreteStateThreeHouses.new)
  end
end

class ConcreteStateThreeHouses < State
  def twoHouses
    puts 'ConcreteStateThreeHouses handles twoHouses.'
    puts 'ConcreteStateThreeHouses wants to change the state of the context.'
    @context.transition_to(ConcreteStateTwoHouses.new)
  end

  def fourHouses
    puts 'ConcreteStateThreeHouses handles fourHouses.'
    puts 'ConcreteStateThreeHouses wants to change the state of the context.'
    @context.transition_to(ConcreteStateFourHouses.new)
  end
end

class ConcreteStateFourHouses < State
  def threeHouses
    puts 'ConcreteStateFourHouses handles threeHouses.'
    puts 'ConcreteStateFourHouses wants to change the state of the context.'
    @context.transition_to(ConcreteStateThreeHouses.new)
  end

  def hotel
    puts 'ConcreteStateFourHouses handles hotel.'
    puts 'ConcreteStateFourHouses wants to change the state of the context.'
    @context.transition_to(ConcreteStateHotel.new)
  end
end

class ConcreteStateHotel < State
  def fourHouses
    puts 'ConcreteStateHotel handles fourHouses.'
    puts 'ConcreteStateHotel wants to change the state of the context.'
    @context.transition_to(ConcreteStateFourHouses.new)
  end

  def hotel
    puts 'ConcreteStateHotel handles hotel.'
  end
end

class ConcreteStateMortgage < State
  def singleProperty
    puts 'ConcreteStateMortgage handles singleProperty.'
    puts 'ConcreteStateMortgage wants to change the state of the context.'
    @context.transition_to(ConcreteStateSingleProperty.new)
  end

  def allProperty
    puts 'ConcreteStateMortgage handles allProperty.'
    puts 'ConcreteStateMortgage wants to change the state of the context.'
    @context.transition_to(ConcreteStateAllProperty.new)
  end

end

# The client code.

context = Context.new(ConcreteStateSingleProperty.new)
context.singleProperty
context.allProperty
context.oneHouse
context.twoHouses
context.threeHouses
context.fourHouses
context.hotel
context.fourHouses
context.threeHouses
context.twoHouses
context.oneHouse
context.allProperty
context.singleProperty
context.mortgage
context.singleProperty
context.allProperty
context.mortgage
context.singleProperty