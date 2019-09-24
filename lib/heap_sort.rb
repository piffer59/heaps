require_relative "min_heap.rb"

# This method uses a heap to sort an array.
# Time Complexity:  O(log n), where n is the number of elements in the array, because both the add() and remove() methods are recursive
# Space Complexity: O(log n), where n is the number of elements in the array, because both the add() and remove() methods are recursive
def heapsort(list)
  heap = MinHeap.new

  list.each do |val|
    heap.add(val)
  end

  sorted_array = []

  i = 0
  while i < list.length
    removed_node = heap.remove
    sorted_array << removed_node
    i += 1
  end

  return sorted_array
end
