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
    left, right = current.left, current.right

    if current.value == search_value
      puts current
      exit
    end

    if !left.nil? && !visited.include?(left)
      if left.value == search_value
        puts left
        puts left.value
        exit
      end
      visited << left
      queue << left
    end

    if !right.nil? && !visited.include?(right)
      if right.value == search_value
        puts right
        puts right.value
        exit
      end
      visited << right
      queue << right
    end
  end
  puts "nil"
end

binary_tree = build_tree([4,7,2,8,1,1,1,30,22,4,9])

breadth_first_search(30, binary_tree)


