class Array
  # ----------- Linear search -----------
  # each_with_index { |num, index| return index if num == element } works slower on long arrays
  def linear_search(element)
    (length).times { |index| return index if self[index] == element }
    nil
  end

  # ----------- Binary search ----------- only sorting array
  def binary_search(element)
    binary_search_recursive(element, 0, length - 1)
  end

  def binary_search_recursive(element, start_index, end_index)
    return nil if empty?
    return nil if start_index == end_index
    middle = (start_index + end_index + 1) / 2
    return middle if self[middle] == element
    self[middle] < element ? start_index = middle : end_index = middle - 1
    binary_search_recursive(element, start_index, end_index)
  end

  # idea from me, refactoring from stackoverflow :)
  # this method uses less resources because length of array is decreasing
  def binary_search_nz(element)
    return nil if empty?
    middle = length / 2
    case element <=> self[middle]
    when 0
      middle
    when -1
      take(middle).binary_search_nz(element)
    when 1
      amendment = drop(middle + 1).binary_search_nz(element)
      amendment.nil? ? nil : amendment + middle + 1
    end
  end

  # ----------- Interpolation search -----------
  # binary_search analog, but middle is calculated by other formula
  def interpolation_search(element)
    left = 0
    right = length - 1

    while self[left] < element && element < self[right]
      mid = left + (element - self[left]) * (right - left) / (self[right] - self[left])
      if self[mid] < element
        left = mid + 1
      elsif self[mid] > element
        right = mid - 1
      else
        return mid
      end
    end

    return left if self[left] == element
    return right if self[right] == element
    nil
  end
end
