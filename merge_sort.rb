def merge_sort(array)
  n = array.length
  if n < 2
    return
  else 
    left, right = array.each_slice((array.length/2.0).round).to_a
  end
  merge_sort(left)
  merge_sort(right)
  merge(left,right,array)
end

def merge(left, right, array)
  left_length = left.length
  right_length = right.length
  array_length = array.length
  i = 0
  j = 0
  k = 0
  while (i < left_length && j < right_length)
    if left[i] <= right[j]
      array[k] = left[i]
      i += 1
    elsif right[j] <= left[i]
      array[k] = right[j]
      j += 1
    end
    k += 1
  end
  while (i < left_length)
    array[k] = left[i]
    i += 1
    k += 1
  end
  while (j < right_length)
    array[k] = right[j]
    j += 1
    k += 1
  end
  array
end

#p merge_sort([4,7,2,8,1,1,1,30,22,4,9])
