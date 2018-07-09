# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require 'bst_node'

class BinarySearchTree
  attr_reader :root
  def initialize
    @root = nil
  end

  def insert(value)
    if root
      rec_insert(value)
    else
      @root = BSTNode.new(value)
    end
  end

  def find(value, tree_node = @root)
    return nil unless tree_node
    return tree_node if value == tree_node.value
    tree_node = value < tree_node.value ? tree_node.left : tree_node.right 
    find(value, tree_node)
  end

  def delete(value, node = @root)
    return nil unless node
    if value == node.value
      return @root = nil unless node.parent
      return node.left unless node.right
      return node.right unless node.left
      new_node = maximum(node.left)
      new_node.parent.right = new_node.left
      new_node.left = node.left
      new_node.right = node.right
      return new_node
    end
    if value < node.value
      node.left = delete(value, node.left)
    else
      node.right = delete(value, node.right)
    end
    node
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return nil unless tree_node
    return tree_node unless tree_node.right
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return -1 unless tree_node
    left = 1 + depth(tree_node.left)
    right = 1 + depth(tree_node.right)
    left > right ? left : right
  end 

  def is_balanced?(tree_node = @root)
    depth(tree_node.left) == depth(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [] unless tree_node
    arr += in_order_traversal(tree_node.left)
    arr << tree_node.value
    arr += in_order_traversal(tree_node.right)
  end

  private
  # optional helper methods go here:
  def rec_insert(value, node = @root)
    return BSTNode.new(value) unless node
    if value <= node.value
      node.left = rec_insert(value, node.left)
      node.left.parent = node
    else
      node.right = rec_insert(value, node.right)
      node.right.parent = node
    end
    node
  end
end
