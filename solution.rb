class Solution

  def get_solution(train)
    @train = train
    @total = 0

    @train.change_state true if light_off

    take_walk
    @total
  end

  def take_walk
    @current_total = 0
    return if light_off

    go_ahead_and_back
    take_walk if light_on

    @total = @current_total
  end

  def go_ahead_and_back
    go_until_light_on
    @train.change_state false
    go_back
  end

  def go_until_light_on
    @train.go_right
    @current_total += 1
    return if light_on

    go_until_light_on
  end

  def go_back
    @current_total.times { @train.go_left }
  end

  def light_on
    @train.get_current_state
  end

  def light_off
    !@train.get_current_state
  end
end
