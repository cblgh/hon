class Array

  # runs in O(log n)
  def binary_search(value)
    return false if self.empty?
    
    mid = self.length / 2
    return true if self[mid] == value

    if self[mid] > value
      self[0...mid].binary_search(value)
    elsif self[mid] < value
      self[mid+1..-1].binary_search(value)
    end
  end

  # runs in O(n) time
  def linear_search(value)
    return false if self.empty?
    self.each { |n| return true if n == value }
    return false
  end

  # our array is 2 dimensional
  # runs in O(n^2) time
  def exponential_search(value)
    self.each do |inner_array|
      inner_array.each do |n|
        return true if n == value
      end
    end
  end

  # bucket_sort, not worried about repeats
  def bucket_sort
    buckets = []                      # O(1)
    num_buckets = self.max + 1        # O(n)
    num_buckets.times do              # O(n)
      buckets << ''                   #   O(1)
    end

    self.each do |n|    # O(n)
      buckets[n] = n                  #   O(1)
    end

    out = []                          # O(1)
    buckets.each do |el|              # O(n)
      out << el if el != ''           #   O(1)
    end

    return out
  end

end

[5,3,4].bucket_sort