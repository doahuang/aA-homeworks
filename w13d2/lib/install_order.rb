# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require 'graph'
require 'topological_sort'

def install_order(arr)
  vertices = {}
  (1..arr.flatten.max).each do |i|
    vertices[i] = Vertex.new(i)
  end

  arr.each do |(to, from)|
    from, to = vertices[from], vertices[to]
    Edge.new(from, to)
  end

  sorted = topological_sort(vertices.values)
  sorted.map(&:value)
end
