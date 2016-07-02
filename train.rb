class Train

  def set_railways(railways)
    @railways = railways
    @current = 0
  end

  def get_real_size
    @railways.size
  end

  def go_right
    @current += 1
    if @current >= @railways.size
      @current = 0
    end
    get_current_state
  end

  def go_left
    @current -= 1
    if @current < 0
      @current = @railways.size - 1
    end
    get_current_state
  end

  def get_current_state
    @railways[@current]
  end

  def change_state(state)
    @railways[@current] = state
    get_current_state
  end
end
