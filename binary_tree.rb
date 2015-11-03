require_relative 'merge_sort'

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end
end

def build_tree(array, *indices)
  if !array.each_cons(2).all? {|a,b| (a <=> b) <= 0}
    array = merge_sort(array.uniq!)
  end
  mid = (array.length-1)/2
  first_element = indices[0]
  last_element = indices[1]

  if !first_element.nil? && first_element >last_element
    return nil 
  end
  
  root = Node.new(array[mid])
  root.left = build_tree(array[0..mid-1], 0, mid-1)
  root.right = build_tree(array[mid+1..-1], mid+1, array.length-1)

  return root
end

def breadth_first_search(search_value, tree)
  queue = [tree]
  visited = [tree]

  while !queue.empty? 
    current = queue.shift
    visited << current

    if current.value == search_value
      puts current
      exit
    end

    if !current.left.nil? && !visited.include?(current.left)
      if current.left.value == search_value
        puts current.left
        exit
      else
        visited << current.left
        queue << current.left
      end
    end

    if !current.right.nil? && !visited.include?(current.right)
      if current.right.value == search_value
        puts current.right
        exit
      else
        visited << current.right
        queue << current.right
      end
    end
  end
  puts "nil"
end

def depth_first_search(search_value, tree)
  stack = [tree]
  visited = [tree]
    
  while !stack.empty?
    current = stack.last
    visited << current

    if current.value == search_value
      puts current
      exit
    elsif !current.left.nil? && !visited.include?(current.left)
      if current.left.value == search_value
        puts current.left
        exit
      else
        visited << current.left
        stack << current.left
      end
    elsif !current.right.nil? && !visited.include?(current.right)
      if current.right.value == search_value
        puts current.right
        exit
      else
        visited << current.right
        stack << current.right
      end
    else
      stack.pop
    end
  end
  puts "nil"
end

def dfs_rec(search_value, tree)
  current = tree
  return if current == nil 
  if current.value == search_value
    puts current
    exit
  end

  dfs_rec(search_value, current.left)
  dfs_rec(search_value, current.right)
end

binary_tree = build_tree([1,2,3,4,5,6,7,8,9])

breadth_first_search(9, binary_tree)
# depth_first_search(3, binary_tree)
# dfs_rec(6, binary_tree)


