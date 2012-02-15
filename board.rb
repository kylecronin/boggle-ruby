class Board
  def initialize(state)
    @xmax = state.size
    @ymax = state[0].size
    
    state.each do |row|
      raise "Board rows are of varying lengths" if row.size != @ymax
    end
    
    @state = state
  end
  
  def [](a, b)
    @state[a][b]
  end
  
  def each()
    for x in 0...@xmax
      for y in 0...@ymax
        yield x, y
      end
    end
  end
  
  def neighbor_iter(x, y)
    temp = @state[x][y]
    @state[x][y] = nil
    
    xrange = ([x-1, 0].max)..([x+1, @xmax-1].min)
    yrange = ([y-1, 0].max)..([y+1, @ymax-1].min)
    
    for i in xrange
      for j in yrange
        yield i, j if @state[i][j]
      end
    end
    
    @state[x][y] = temp
  end
end