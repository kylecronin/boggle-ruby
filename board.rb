class Board
  def initialize(state)
    @state = state
    @xmax = state.size
    @ymax = state[0].size
  end
  
  def [](a, b)
    @state[a][b]
  end
  
  def []=(a, b, x)
    @state[a][b] = x
  end
  
  def each()
    for x in 0...@xmax
      for y in 0...@ymax
        yield x, y
      end
    end
  end
  
  def neighbor_iter(x, y)
    temp = self[x, y]
    self[x, y] = nil
    
    xrange = ([x-1, 0].max)..([x+1, @xmax-1].min)
    yrange = ([y-1, 0].max)..([y+1, @ymax-1].min)
    
    for i in xrange
      for j in yrange
        yield i, j if self[i, j]
      end
    end
    
    self[x, y] = temp
  end
end