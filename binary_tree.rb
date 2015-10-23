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
  puts root.value
  root.left = build_tree(array[0..mid-1], 0, mid-1)
  root.right = build_tree(array[mid+1..-1], mid+1, array.length-1)

  return root
end



puts build_tree([4,7,2,8,1,1,1,30,22,4,9])

puts build_tree([1,2,3,4,5,6,7,8,9])