require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# def topological_sort(vertices)
#   sorted = []
#   queue = []

#   vertices.each do |vertex|
#     queue << vertex if vertex.in_edges.empty?
#   end
  
#   until queue.empty?
#     current = queue.pop
#     sorted << current
#     current.out_edges.each do |edge|
#       dest = edge.to_vertex
#       dest.in_edges.delete(edge)
#       queue << dest if dest.in_edges.empty?
#     end
#   end
  
#   sorted.length == vertices.length ? sorted : []
# end

def topological_sort(vertices)
  sorted = []
  visited = Set.new
  temp = Set.new
  cycle = false

  vertices.each do |vertex|
    cycle = visit(vertex, visited, sorted, temp, cycle)
    return [] if cycle
  end

  sorted
end

def visit(vertex, visited, sorted, temp, cycle)
  return if visited.include?(vertex)
  return true if temp.include?(vertex)
  temp.add(vertex)
  
  vertex.out_edges.each do |edge|
    dest = edge.to_vertex
    cycle = visit(dest, visited, sorted, temp, cycle)
    return true if cycle
  end
  
  visited.add(vertex)
  temp.delete(vertex)
  sorted.unshift(vertex)
  false
end
  