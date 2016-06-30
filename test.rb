require "test/unit"

require './train.rb'
require './solution.rb'

class TestTrain < Test::Unit::TestCase

  def test_train
    test_data = lambda do |ar|
      t = Train.new
      t.set_railways ar
      s = Solution.new
      result = s.get_solution t
      result == t.get_real_size
    end

    assert test_data.call [true]
    assert test_data.call [false]
    assert test_data.call [true, true, true]
    assert test_data.call [false, false, false]
    assert test_data.call [true, true, true, true]
    assert test_data.call [false, false, false, false]
    assert test_data.call [true, false, true, false]

    50.times do
      ar = Array.new(rand(1..40), true) + Array.new(rand(1..40), false)
      newa = ar.shuffle
      assert test_data.call newa
    end

  end

end
