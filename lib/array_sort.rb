class ArraySort
  # class for sorting methods

  class << self
    # because this methods modify an object, used method_name and method_name!
    %i[bubble_sort selection_sort quick_sort].each do |method|
      define_method(method) { |array| send(:"#{method}!", array.dup) }
    end

    # swap adjacent elements if they are in the wrong order.
    # I use not_changed variable to speed up in some cases
    def bubble_sort!(array)
      (array.length - 1).times do |j|
        not_changed = true
        (array.length - 1 - j).times do |i|
          if array[i] > array[i + 1]
            array[i], array[i + 1] = array[i + 1], array[i]
            not_changed = false
          end
        end
        return array if not_changed
      end
      array
    end

    # swap current element with the min element on the right
    def selection_sort!(array)
      (0...array.length).each do |i|
        index_min = i
        (i + 1...array.length).each do |j|
          index_min = j if array[index_min] > array[j]
        end
        array[i], array[index_min] = array[index_min], array[i]
      end
      array
    end

    # Quicksort (Hoare sorting). Recursive algoritm.
    def quick_sort!(array)
      return array if array.length < 2
      current_element = array.pop
      less, more = array.partition { |i| i < current_element }
      quick_sort(less) + [current_element] + quick_sort(more)
    end
  end
end
