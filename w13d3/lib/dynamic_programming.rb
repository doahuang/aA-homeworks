class DynamicProgramming
  attr_reader :blair_cache
  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frog_cache = {}
  end

  def blair_nums(n)
    return blair_cache[n] if blair_cache[n]
    res = blair_nums(n - 2) + blair_nums(n - 1) + 2 * n - 3
    blair_cache[n] = res
    res
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    cache = { 
      1 => [[1]], 
      2 => [[1, 1], [2]],
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
    }
    return cache if n < 4
    (4..n).each do |stair|
      res = []
      (1..3).each do |jump|
        cache[stair - jump].each do |arr|
          res << arr + [jump]
        end
      end
      cache[stair] = res
    end
    cache
  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
