class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap
  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n), n is the number of nodes in the heap
  # Space Complexity: O(log n), n is the number of nodes in the heap, this is a recursive function
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store << new_node
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n), n is the number of nodes in the heap
  # Space Complexity: O(log n), n is the number of nodes in the heap, this is a recursive function
  def remove()
    return if @store.length == 0
    swap(0, -1)
    removed_node = @store.pop
    heap_down(0)
    return removed_node.value
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"

    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(n), where n is the number of nodes in the heap
  # Space complexity: O(1)
  def empty?
    if @store.length == 0
      return true
    end

    return false
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n), where n is the number of nodes in the heap
  # Space complexity: O(log n), where n is the number of nodes in the heap because this is recursive
  def heap_up(index)
    return if index == 0

    parent_index = (index - 1) / 2
    if @store[parent_index].key > @store[index].key
      swap(index, parent_index)
      heap_up(parent_index)
    end
    return
  end

  # This helper method takes an index and
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = index * 2 + 1
    right_child = index * 2 + 2

    if @store[left_child].nil?
      #could use the length
      return
    end
    if @store[right_child].nil?
      if @store[index].key > @store[left_child].key
        swap(index, left_child)
      end
      return
    end

    if @store[left_child].key < @store[right_child].key
      swap(left_child, index)
      heap_down(left_child)
    else
      swap(right_child, index)
      heap_down(right_child)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
