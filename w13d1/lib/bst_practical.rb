require 'binary_search_tree'

def kth_largest(tree_node, k)
  bst = BinarySearchTree.new
  arr = bst.in_order_traversal(tree_node)
  kth = arr[arr.length - k]
  bst.find(kth, tree_node)
end
