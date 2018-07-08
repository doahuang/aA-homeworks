# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require 'bst_node'

class BinarySearchTree
  attr_reader :root
  def initialize
    @root = nil
  end

  def insert(value)
    root ? self.class.insert(value, root) : @root = BSTNode.new(value)
  end

  def find(value, tree_node = @root)
    self.class.find(value, tree_node)
  end

  def delete(value)
    self.class.delete(value, root)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    self.class.maximum(tree_node)
  end

  def depth(tree_node = @root)
    self.class.depth(tree_node)
  end 

  def is_balanced?(tree_node = @root)
    depth(tree_node.left) == depth(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    
  end


  private
  # optional helper methods go here:
  def self.insert(value, node)
    return BSTNode.new(value) unless node
    if value <= node.value
      node.left = insert(value, node.left)
    else
      node.right = insert(value, node.right)
    end
    node
  end

  def self.find(value, tree_node)
    return nil unless tree_node
    return tree_node if value == tree_node.value
    tree_node = value < tree_node.value ? tree_node.left : tree_node.right
    find(value, tree_node)
  end

  def self.delete(value, node)
    return nil unless node 
    #
  end

  def self.maximum(node)
    return nil unless node
    return maximum(node.right) if node.right
    node
  end

  def self.depth(node)
    return -1 unless node
    left = 1 + depth(node.left)
    right = 1 + depth(node.right)
    left > right ? left : right
  end
end
