
def kth_largest(tree_node, k)
  arr = in_order_traversal(tree_node)
  kth = arr[-k]
end

def in_order_traversal(tree_node, arr = [])
  return [] unless tree_node
  arr += in_order_traversal(tree_node.left)
  arr << tree_node
  arr += in_order_traversal(tree_node.right)
end