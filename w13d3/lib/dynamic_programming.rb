class DynamicProgramming
  attr_reader :blair_cache, :frog_cache, :maze_cache

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frog_cache = {
      1 => [[1]], 
      2 => [[1, 1], [2]],
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
    }
    @maze_cache = {}
  end

  def blair_nums(n)
    return blair_cache[n] if blair_cache[n]
    res = blair_nums(n - 2) + blair_nums(n - 1) + 2 * n - 3
    blair_cache[n] = res
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n, k = 3)
    cache = { 0 => [[]], 1 => [[1]] }
    
    (2..n).each do |stair|
      res = []
      (1..k).each do |jump|
        break if jump > stair
        cache[stair - jump].each do |arr|
          res << arr + [jump]
        end
      end
      cache[stair] = res
    end
    cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return frog_cache[n] if frog_cache[n]
    res = []
    (1..3).each do |jump|
      frog_hops_top_down_helper(n - jump).each do |arr|
        res << arr + [jump]
      end
    end
    frog_cache[n] = res
  end

  def super_frog_hops(n, k)
    cache = frog_cache_builder(n, k)
    cache[n]
  end

  def knapsack(weights, values, capacity)
    return 0 if weights.empty? || capacity == 0
    table = knapsack_table(weights, values, capacity)
    table[capacity].last
    # table.last.last
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    table = []

    (0..capacity).each do |i|
      table[i] = []

      weights.each_index do |j|
        if i == 0 
          table[i][j] = 0
        elsif j == 0
          table[i][j] = weights[j] > i ? 0 : values[j]
        else
          option1 = table[i][j - 1]
          option2 = weights[j] > i ? 0 : table[i - weights[j]][j - 1] + values[j]
          optimum = [option1, option2].max
          table[i][j] = optimum
        end
      end
    end

    table
    # weights.each_index do |i|
    #   res = []
    #   item = weights[i]

    #   (0..capacity).each do |cap|
    #     last_best = i == 0 ? 0 : table[i - 1][cap]

    #     if item <= cap
    #       if i == 0
    #         res << values[0]
    #       else
    #         next_best = table[i - 1][cap - item]
    #         best = [values[i] + next_best, last_best].max
    #         res << best
    #       end
    #     else
    #       res << last_best
    #     end
    #   end

    #   table << res
    # end

    # table
  end

  def maze_solver(maze, start_pos, end_pos)
    build_cache(start_pos)
    solve_maze(maze, start_pos, end_pos)
    find_path(end_pos)
  end

  private

  def solve_maze(maze, start_pos, end_pos)
    return true if start_pos == end_pos

    get_moves(maze, start_pos).each do |next_pos|
      unless maze_cache.keys.include?(next_pos)
        maze_cache[next_pos] = start_pos
        solve_maze(maze, next_pos, end_pos)
      end
    end
  end

  def build_cache(start_pos)
    maze_cache[start_pos] = nil
  end

  def find_path(end_pos)
    path = []
    current = end_pos

    until current.nil?
      path.unshift(current)
      current = maze_cache[current]
    end

    path
  end

  def get_moves(maze, from_pos)
    directions = [[0, 1], [1, 0], [-1, 0], [0, -1]]
    x, y = from_pos
    result = []

    directions.each do |dx, dy|
      next_pos = [x + dx, y + dy]
      result << next_pos if is_valid_pos?(maze, next_pos)
    end

    result
  end

  def is_valid_pos?(maze, pos)
    x, y = pos
    x >= 0 && y >= 0 && 
      x < maze.length && y < maze.first.length && 
        maze[x][y] != "X"
  end
end