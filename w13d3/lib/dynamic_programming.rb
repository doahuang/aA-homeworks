class DynamicProgramming
  attr_reader :blair_cache, :frog_cache

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frog_cache = {
      1 => [[1]], 
      2 => [[1, 1], [2]],
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
    }
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
    return 0 if capacity == 0
    knapsack_table(weights, values, capacity).last.last
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    table = []

    weights.each_index do |i|
      res = []
      item = weights[i]

      (0..capacity).each do |cap|
        last_best = i == 0 ? 0 : table[i - 1][cap]

        if item <= cap
          if i == 0
            res << values[0]
          else
            next_best = table[i - 1][cap - item]
            best = [values[i] + next_best, last_best].max
            res << best
          end
        else
          res << last_best
        end
      end

      table << res
    end

    table
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
