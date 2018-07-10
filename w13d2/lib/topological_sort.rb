require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  queue = []

  vertices.each do |vertex|
    queue << vertex if vertex.in_edges.empty?
  end
  
  until queue.empty?
    current = queue.pop
    sorted << current
    current.out_edges.each do |edge|
      dest = edge.to_vertex
      dest.in_edges.delete(edge)
      queue << dest if dest.in_edges.empty?
    end
  end
  
  sorted.length == vertices.length ? sorted : []
end

# def topological_sort(vertices)
#   sorted = []
#   visited = [] 

#   vertices.each do |vertex|
#     visit(vertex, visited, sorted)
#   end

#   sorted
# end

# def visit(vertex, visited, sorted)
#   return if visited.include?(vertex)
#   visited << vertex 

#   vertex.out_edges.each do |edge|
#     dest = edge.to_vertex
#     visit(dest, visited, sorted)
#   end

#   sorted.unshift(vertex)
# end
  